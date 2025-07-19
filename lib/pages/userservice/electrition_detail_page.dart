// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:skill_link/pages/Apis.dart';
// import 'package:skill_link/pages/userservice/electricianservice.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'electricianmodel.dart';

// class ElectricianDetailPage extends StatefulWidget {
//   final Electrician electrician;

//   const ElectricianDetailPage({Key? key, required this.electrician})
//       : super(key: key);

//   @override
//   State<ElectricianDetailPage> createState() => _ElectricianDetailPageState();
// }

// class _ElectricianDetailPageState extends State<ElectricianDetailPage> {
//   File? _selectedImage;
//   final ImagePicker _picker = ImagePicker();
//   final TextEditingController _problemController = TextEditingController();

//   final Color darkBlue = const Color(0xFF003E6B);
//   final Color tealBlue = const Color(0xFF00A8A8);

//   void _showImageSourceOptions() {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return SafeArea(
//           child: Wrap(
//             children: <Widget>[
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text('Camera'),
//                 onTap: () async {
//                   Navigator.of(context).pop();
//                   final XFile? image =
//                       await _picker.pickImage(source: ImageSource.camera);
//                   if (image != null) {
//                     setState(() => _selectedImage = File(image.path));
//                   }
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('Gallery'),
//                 onTap: () async {
//                   Navigator.of(context).pop();
//                   final XFile? image =
//                       await _picker.pickImage(source: ImageSource.gallery);
//                   if (image != null) {
//                     setState(() => _selectedImage = File(image.path));
//                   }
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.insert_drive_file),
//                 title: const Text('Files'),
//                 onTap: () async {
//                   Navigator.of(context).pop();
//                   FilePickerResult? result =
//                       await FilePicker.platform.pickFiles(type: FileType.image);
//                   if (result != null && result.files.single.path != null) {
//                     setState(
//                         () => _selectedImage = File(result.files.single.path!));
//                   }
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Future<void> _submitProblem() async {
//     if (_problemController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter the problem description.')),
//       );
//       return;
//     }

//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final String? token = prefs.getString('bearer_token');
//       final int? userProfileId = prefs.getInt('user_profile_id');

//       if (token == null || userProfileId == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//               content: Text('User not authenticated or profile ID missing.')),
//         );
//         return;
//       }

//       final int electricianId = widget.electrician.id;
//       if (electricianId == 0) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Invalid electrician ID.')),
//         );
//         return;
//       }

//       final uri = Uri.parse('$baseUrl/api/electrician_appointment');
//       final request = http.MultipartRequest('POST', uri)
//         ..headers['Authorization'] = 'Bearer $token'
//         ..fields['electrician_p_id'] = electricianId.toString()
//         ..fields['user_p_id'] = userProfileId.toString()
//         ..fields['description'] = _problemController.text;

//       if (_selectedImage != null) {
//         request.files.add(await http.MultipartFile.fromPath(
//           'e_problem_image',
//           _selectedImage!.path,
//         ));
//       }

//       final response = await request.send();

//       if (response.statusCode == 201) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Problem submitted successfully!')),
//         );

//         setState(() {
//           _problemController.clear();
//           _selectedImage = null;
//         });

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => ElectricianPage()),
//         );
//       } else {
//         final body = await response.stream.bytesToString();
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to submit problem: $body')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('An error occurred. Please try again.')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _problemController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final electrician = widget.electrician;

//     String? imageUrl;
//     if (electrician.electricianImage != null &&
//         electrician.electricianImage!.isNotEmpty) {
//       if (electrician.electricianImage!.startsWith('http')) {
//         imageUrl = electrician.electricianImage!;
//       } else {
//         final baseImageUrl = baseUrl.endsWith('/')
//             ? '${baseUrl}uploads/electrician_image/'
//             : '$baseUrl/uploads/electrician_image/';
//         imageUrl = '$baseImageUrl${electrician.electricianImage}';
//       }
//     }

//     return Scaffold(
//       backgroundColor: darkBlue,
//       appBar: AppBar(
//         backgroundColor: tealBlue,
//         title: Text(electrician.fullName),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Center(
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundColor: Colors.grey[300],
//                 child: ClipOval(
//                   child: SizedBox(
//                     width: 120,
//                     height: 120,
//                     child: imageUrl != null && imageUrl.isNotEmpty
//                         ? Image.network(
//                             imageUrl,
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) {
//                               return Image.asset(
//                                 'assets/images/placeholder.png',
//                                 fit: BoxFit.cover,
//                               );
//                             },
//                           )
//                         : Image.asset(
//                             'assets/images/placeholder.png',
//                             fit: BoxFit.cover,
//                           ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               electrician.fullName,
//               style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//             const SizedBox(height: 20),
//             buildDetailRow('Experience', '${electrician.experience} years'),
//             buildDetailRow('Hourly Rate', 'Rs: ${electrician.hourlyRate}/hr'),
//             const SizedBox(height: 30),
//             ElevatedButton.icon(
//               onPressed: _showImageSourceOptions,
//               icon: const Icon(Icons.upload),
//               label: const Text('Upload Problem Image'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber[700],
//                 foregroundColor: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 20),
//             if (_selectedImage != null) ...[
//               const Text('Selected Image Preview:',
//                   style: TextStyle(color: Colors.white)),
//               const SizedBox(height: 10),
//               Image.file(_selectedImage!, width: 150, height: 150),
//             ],
//             const SizedBox(height: 30),
//             TextField(
//               controller: _problemController,
//               maxLines: 4,
//               style: const TextStyle(color: Colors.white),
//               decoration: const InputDecoration(
//                 labelText: 'Enter your problem',
//                 hintText: 'Describe your electrical issue...',
//                 labelStyle: TextStyle(color: Colors.white),
//                 hintStyle: TextStyle(color: Colors.white70),
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.report_problem, color: Colors.white),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white70),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.amber),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton.icon(
//               onPressed: _submitProblem,
//               icon: const Icon(Icons.send),
//               label: const Text('Submit Problem'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 foregroundColor: Colors.white,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildDetailRow(String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 3,
//             child: Text(
//               "$title:",
//               style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//           ),
//           Expanded(
//             flex: 5,
//             child: Text(value,
//                 style: const TextStyle(fontSize: 16, color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:skill_link/pages/Apis.dart';
import 'package:skill_link/pages/userservice/electricianservice.dart';
import 'electricianmodel.dart';

class ElectricianDetailPage extends StatefulWidget {
  final Electrician electrician;

  const ElectricianDetailPage({Key? key, required this.electrician})
      : super(key: key);

  @override
  State<ElectricianDetailPage> createState() => _ElectricianDetailPageState();
}

class _ElectricianDetailPageState extends State<ElectricianDetailPage> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _problemController = TextEditingController();

  final Color darkBlue = const Color(0xFF003E6B);
  final Color tealBlue = const Color(0xFF00A8A8);

  void _showImageSourceOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    setState(() => _selectedImage = File(image.path));
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() => _selectedImage = File(image.path));
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file),
                title: const Text('Files'),
                onTap: () async {
                  Navigator.of(context).pop();
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(type: FileType.image);
                  if (result != null && result.files.single.path != null) {
                    setState(
                        () => _selectedImage = File(result.files.single.path!));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _submitProblem() async {
    if (_problemController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the problem description.')),
      );
      return;
    }

    try {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('bearer_token');
      final int? userProfileId = prefs.getInt('user_profile_id');

      if (token == null || userProfileId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('User not authenticated or profile ID missing.')),
        );
        return;
      }

      final int electricianId = widget.electrician.id;
      if (electricianId == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid electrician ID.')),
        );
        return;
      }

      final uri = Uri.parse('$baseUrl/api/electrician_appointment');
      final request = http.MultipartRequest('POST', uri)
        ..headers['Authorization'] = 'Bearer $token'
        ..fields['electrician_p_id'] = electricianId.toString()
        ..fields['user_p_id'] = userProfileId.toString()
        ..fields['description'] = _problemController.text;

      if (_selectedImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'e_problem_image',
          _selectedImage!.path,
        ));
      }

      final response = await request.send();

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Problem submitted successfully!')),
        );
        setState(() {
          _problemController.clear();
          _selectedImage = null;
        });
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ElectricianPage()));
      } else {
        final body = await response.stream.bytesToString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit problem: $body')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred. Please try again.')),
      );
    }
  }

  @override
  void dispose() {
    _problemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final electrician = widget.electrician;
    final String? imageUrl = electrician.electricianImage.trim().isNotEmpty
        ? electrician.electricianImage.trim()
        : null;

    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        backgroundColor: tealBlue,
        title: Text(electrician.fullName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                child: ClipOval(
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: (imageUrl != null && imageUrl.isNotEmpty)
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/placeholder.png',
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        : Image.asset(
                            'assets/images/placeholder.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              electrician.fullName,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            buildDetailRow('Experience', '${electrician.experience} years'),
            buildDetailRow('Hourly Rate', 'Rs: ${electrician.hourlyRate}/hr'),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _showImageSourceOptions,
              icon: const Icon(Icons.upload),
              label: const Text('Upload Problem Image'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[700],
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            if (_selectedImage != null) ...[
              const Text('Selected Image Preview:',
                  style: TextStyle(color: Colors.white)),
              const SizedBox(height: 10),
              Image.file(_selectedImage!, width: 150, height: 150),
            ],
            const SizedBox(height: 30),
            TextField(
              controller: _problemController,
              maxLines: 4,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Enter your problem',
                hintText: 'Describe your electrical issue...',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.report_problem, color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _submitProblem,
              icon: const Icon(Icons.send),
              label: const Text('Submit Problem'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "$title:",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(value,
                style: const TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
