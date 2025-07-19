import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_link/pages/Apis.dart';
import 'package:device_info_plus/device_info_plus.dart';

final Color darkBlue = Color(0xFF003E6B);
final Color tealBlue = Color(0xFF00A8A8);

// Updated image folder path for electrician
final String imageBaseUrl = "$baseUrl/uploads/electrician_appointment_image/";

class AppointmentList extends StatefulWidget {
  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  List<dynamic> appointments = [];
  Map<int, String> userNames = {};
  bool loading = true;
  String? errorMessage;
  late AndroidDeviceInfo androidInfo;

  @override
  void initState() {
    super.initState();
    initDeviceInfo();
    fetchAppointments();
  }

  Future<void> initDeviceInfo() async {
    androidInfo = await DeviceInfoPlugin().androidInfo;
  }

  Future<void> fetchAppointments() async {
    setState(() {
      loading = true;
      errorMessage = null;
    });

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('bearer_token');
      final int? electricianId =
          prefs.getInt('electrician_profile_id') ?? prefs.getInt('user_id');

      if (token == null || electricianId == null) {
        setState(() {
          loading = false;
          errorMessage = "User is not logged in or ID not found.";
        });
        return;
      }

      final url = Uri.parse(
          '$baseUrl/api/electrician_appointment?electrician_profile_id=$electricianId');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['success'] == true) {
          List<dynamic> allAppointments = jsonResponse['data'];

          List<dynamic> filtered = allAppointments.where((a) {
            final belongsToElectrician =
                a['electrician_p_id']?.toString() == electricianId.toString();
            final notRejected = a['status'] == null ||
                a['status'].toString().toLowerCase() != 'reject';
            return belongsToElectrician && notRejected;
          }).toList();

          await fetchUserNames(filtered, token);

          setState(() {
            appointments = filtered;
            loading = false;
          });
        } else {
          final msg = jsonResponse['message'] ?? "Failed to load appointments.";
          setState(() {
            loading = false;
            errorMessage = msg;
          });
          print(msg); // ✅ This works as expected
        }

      } else {
        setState(() {
          loading = false;
          errorMessage = "Failed with status: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        loading = false;
        errorMessage = "Error: $e";
      });
    }
  }

  Future<void> fetchUserNames(List<dynamic> appointments, String token) async {
    Set<int> userIds = {
      for (var a in appointments)
        if (a['user_p_id'] != null) a['user_p_id'] as int
    };

    for (int id in userIds) {
      if (!userNames.containsKey(id)) {
        try {
          final url = Uri.parse('$baseUrl/api/users/$id');
          final res = await http.get(url, headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          });

          if (res.statusCode == 200) {
            final data = json.decode(res.body);
            final user = data['data'];
            userNames[id] =
                user != null && user['name'] != null ? user['name'] : 'Unknown';
          } else {
            userNames[id] = 'Unknown';
          }
        } catch (e) {
          userNames[id] = 'Unknown';
        }
      }
    }
    setState(() {});
  }

  Future<void> downloadAndOpenImage(String fileName) async {
    if (Platform.isAndroid) {
      int sdkInt = androidInfo.version.sdkInt ?? 0;

      PermissionStatus status;
      if (sdkInt >= 33) {
        status = await Permission.photos.request();
      } else {
        status = await Permission.storage.request();
      }

      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Storage permission is required")),
        );
        return;
      }
    }

    final url = "$imageBaseUrl$fileName";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final dir = await getTemporaryDirectory();
      final filePath = '${dir.path}/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      await OpenFile.open(filePath);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to download image")),
      );
    }
  }

  Future<void> updateAppointmentStatus(int appointmentId, String status) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('bearer_token');

      if (token == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User not authenticated")),
        );
        return;
      }

      final url = Uri.parse(
          '$baseUrl/api/Accept_E_Appointment/$appointmentId'); // ⚠️ Update as per your backend
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        body: {'status': status},
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Appointment $status successfully')),
        );
        fetchAppointments();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update status')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        backgroundColor: tealBlue,
        title:
            Text('Electrician Requests', style: TextStyle(color: Colors.white)),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(
                  child: Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                )
              : appointments.isEmpty
                  ? Center(
                      child: Text(
                        "No appointments found.",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: appointments.length,
                      itemBuilder: (context, index) {
                        final appointment = appointments[index];
                        final userId = appointment['user_p_id'];
                        final userName = userNames[userId] ?? 'Fetching...';
                        final description = appointment['description'] ?? '';
                        final imageFile = appointment['e_problem_image'] ?? '';
                        final appointmentId = appointment['id'];
                        final status = appointment['status']?.toLowerCase();

                        return Card(
                          color: tealBlue.withOpacity(0.2),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: EdgeInsets.only(bottom: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "User-Name: $userName",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Issue: $description",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white70,
                                  ),
                                ),
                                SizedBox(height: 16),
                                imageFile.isNotEmpty
                                    ? TextButton(
                                        onPressed: () {
                                          downloadAndOpenImage(imageFile);
                                        },
                                        child: Text(
                                          "View Image",
                                          style: TextStyle(
                                            color: Colors.yellow,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      )
                                    : Text("No image provided",
                                        style: TextStyle(color: Colors.yellow)),
                                SizedBox(height: 16),
                                if (status == 'accept')
                                  ElevatedButton(
                                    onPressed: null,
                                    style: ElevatedButton.styleFrom(
                                      disabledBackgroundColor: Colors.green,
                                    ),
                                    child: Text(
                                      "Accepted",
                                      style: TextStyle(color: Colors.yellow),
                                    ),
                                  )
                                else
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          foregroundColor: Colors.yellow,
                                        ),
                                        onPressed: () =>
                                            updateAppointmentStatus(
                                                appointmentId, 'accept'),
                                        child: Text('Accept'),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.yellow,
                                        ),
                                        onPressed: () =>
                                            updateAppointmentStatus(
                                                appointmentId, 'reject'),
                                        child: Text('Decline'),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}
