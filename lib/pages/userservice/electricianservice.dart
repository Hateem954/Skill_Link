import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:lottie/lottie.dart';

import 'package:skill_link/pages/Apis.dart';
import 'package:skill_link/pages/userservice/electricianmodel.dart';
import 'package:skill_link/pages/userservice/electrition_detail_page.dart';
// import 'package:plumber_project/pages/userservice/electrician_detail_page.dart';

final Color darkBlue = Color(0xFF003E6B);
final Color tealBlue = Color(0xFF00A8A8);

class ElectricianPage extends StatefulWidget {
  @override
  _ElectricianPageState createState() => _ElectricianPageState();
}

class _ElectricianPageState extends State<ElectricianPage> {
  List<Electrician> _electricians = [];
  bool _loading = true;
  bool _showFindingScreen = true;
  String? _token;
  Position? _userPosition;

  @override
  void initState() {
    super.initState();
    getUserLocationAndFetch();
  }

  Future<void> getUserLocationAndFetch() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showError('Location services are disabled.');
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showError('Location permission denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showError('Location permission is permanently denied.');
      return;
    }

    _userPosition = await Geolocator.getCurrentPosition();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('bearer_token');

    if (_token != null && _token!.isNotEmpty) {
      await fetchElectriciansWithinRadius();
    } else {
      _showError('Unable to retrieve your session. Please log in again.');
    }

    setState(() {
      _showFindingScreen = false;
    });
  }

  Future<void> fetchElectriciansWithinRadius() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/profile'),
        headers: {
          'Authorization': 'Bearer $_token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> allProfiles = data['data'];

        List<Electrician> nearbyElectricians = [];

        for (var profile in allProfiles) {
          if (profile['role'] == 'electrician' &&
              profile['service_area'] != null) {
            String serviceArea = profile['service_area'];

            try {
              List<Location> locations = await locationFromAddress(serviceArea);
              if (locations.isNotEmpty) {
                double distance = Geolocator.distanceBetween(
                  _userPosition!.latitude,
                  _userPosition!.longitude,
                  locations.first.latitude,
                  locations.first.longitude,
                );

                if (distance <= 5000) {
                  if (profile['electrician_image'] != null &&
                      !profile['electrician_image']
                          .toString()
                          .startsWith('http')) {
                    profile['electrician_image'] =
                        '$baseUrl/uploads/electrician_image/${profile['electrician_image']}';
                  }

                  nearbyElectricians.add(Electrician.fromJson(profile));
                }
              }
            } catch (e) {
              print('Geocoding failed for $serviceArea: $e');
              continue;
            }
          }
        }

        setState(() {
          _electricians = nearbyElectricians;
          _loading = false;
        });
      } else {
        setState(() => _loading = false);
        _showError('Server error: ${response.statusCode}');
      }
    } catch (e) {
      setState(() => _loading = false);
      _showError('Failed to fetch electricians.');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        title: Text('Electrician Services'),
        backgroundColor: tealBlue,
      ),
      body: _showFindingScreen
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/animation/finding_providers.json"),
                  SizedBox(height: 20),
                  Text(
                    "Finding nearby electricians...",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            )
          : _loading
              ? Center(child: CircularProgressIndicator(color: tealBlue))
              : _electricians.isEmpty
                  ? Center(
                      child: Text(
                        'No nearby electricians found.',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _electricians.length,
                      itemBuilder: (context, index) {
                        final electrician = _electricians[index];
                        return Card(
                          color: Colors.yellow[300],
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ElectricianDetailPage(electrician: electrician)
                                ),
                              );
                            },
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey[200],
                              child: ClipOval(
                                child: Image.network(
                                  electrician.electricianImage ?? '',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/placeholder.png',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                            title: Text(
                              electrician.fullName,
                              style: TextStyle(
                                color: darkBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '${electrician.experience} years experience',
                              style: TextStyle(color: Colors.black87),
                            ),
                            trailing: Text(
                              'Rs:${electrician.hourlyRate}/hr',
                              style: TextStyle(
                                color: tealBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}
