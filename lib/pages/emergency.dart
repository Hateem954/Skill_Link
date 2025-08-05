// import 'package:flutter/material.dart';

// class EmergencyScreen extends StatelessWidget {
//   const EmergencyScreen({super.key});

//   final List<Map<String, dynamic>> services = const [
//     {"icon": Icons.tap_and_play, "title": "Plumber"},
//     {"icon": Icons.construction, "title": "Labor"},
//     {"icon": Icons.electrical_services, "title": "Electrician"},
//     {"icon": Icons.kitchen, "title": "Appliances"},
//     {"icon": Icons.videocam, "title": "CCTV"},
//     {"icon": Icons.format_paint, "title": "Painting"},
//     {"icon": Icons.carpenter, "title": "Carpenter"},
//     {"icon": Icons.bug_report, "title": "Pest Control"},
//     {"icon": Icons.girl, "title": "Wall Panelling"},
//     {"icon": Icons.wallpaper, "title": "Wall Panelling"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Emergency Services"),
//         backgroundColor: Colors.red,
//       ),
//       body: ListView.separated(
//         padding: const EdgeInsets.all(12),
//         itemCount: services.length,
//         itemBuilder: (context, index) {
//           final service = services[index];
//           return ListTile(
//             leading: Icon(service["icon"], color: Colors.red),
//             title: Text(
//               service["title"],
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             trailing: Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: () {
//               // Optional: Show a dialog or navigate
//               showDialog(
//                 context: context,
//                 builder:
//                     (_) => AlertDialog(
//                       title: Text(service["title"]),
//                       content: Text(
//                         "You tapped on ${service["title"]} (Emergency)",
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: Text("OK"),
//                         ),
//                       ],
//                     ),
//               );
//             },
//           );
//         },
//         separatorBuilder: (context, index) => Divider(),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class EmergencyScreen extends StatelessWidget {
//   const EmergencyScreen({super.key});

//   final List<Map<String, dynamic>> services = const [
//     {"icon": Icons.tap_and_play, "title": "Plumber"},
//     {"icon": Icons.construction, "title": "Labor"},
//     {"icon": Icons.electrical_services, "title": "Electrician"},
//     {"icon": Icons.kitchen, "title": "Appliances"},
//     {"icon": Icons.videocam, "title": "CCTV"},
//     {"icon": Icons.format_paint, "title": "Painting"},
//     {"icon": Icons.carpenter, "title": "Carpenter"},
//     {"icon": Icons.bug_report, "title": "Pest Control"},
//     {"icon": Icons.girl, "title": "Wall Panelling"},
//     {"icon": Icons.wallpaper, "title": "Wall Panelling"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Emergency Services"),
//         backgroundColor: Colors.red,
//       ),
//       body: ListView.separated(
//         padding: const EdgeInsets.all(12),
//         itemCount: services.length,
//         itemBuilder: (context, index) {
//           final service = services[index];
//           return ListTile(
//             leading: Icon(service["icon"], color: Colors.red),
//             title: Text(
//               service["title"],
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             trailing: Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: () {
//               if (service["title"] == "Plumber") {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => PlumberServicesPage()),
//                 );
//               } else if (service["title"] == "Electrician") {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => ElectricianServicesPage()),
//                 );
//               } else {
//                 showDialog(
//                   context: context,
//                   builder:
//                       (_) => AlertDialog(
//                         title: Text(service["title"]),
//                         content: Text(
//                           "You tapped on ${service["title"]} (Emergency)",
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () => Navigator.pop(context),
//                             child: Text("OK"),
//                           ),
//                         ],
//                       ),
//                 );
//               }
//             },
//           );
//         },
//         separatorBuilder: (context, index) => Divider(),
//       ),
//     );
//   }
// }

// class PlumberServicesPage extends StatelessWidget {
//   final List<String> plumberServices = const [
//     "Washbasin Repair",
//     "Tap Leakage Fix",
//     "Toilet Installation",
//     "Drain Cleaning",
//     "Pipe Blockage",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Plumber Services"),
//         backgroundColor: Colors.red,
//       ),
//       body: ListView.builder(
//         itemCount: plumberServices.length,
//         itemBuilder: (context, index) {
//           final serviceName = plumberServices[index];
//           return ListTile(
//             title: Text(serviceName),
//             leading: Icon(Icons.build, color: Colors.red),
//             trailing: Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder:
//                       (_) =>
//                           PlumberSubServiceDetailPage(serviceName: serviceName),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class PlumberSubServiceDetailPage extends StatelessWidget {
//   final String serviceName;

//   const PlumberSubServiceDetailPage({super.key, required this.serviceName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(serviceName), backgroundColor: Colors.red),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Text(
//             "$serviceName Details and Booking Info Coming Soon!",
//             style: TextStyle(fontSize: 18),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ElectricianServicesPage extends StatelessWidget {
//   final List<String> electricianServices = const [
//     "Board Repair",
//     "Short Circuit Fix",
//     "Light Installation",
//     "Fan Repair",
//     "Switch Replacement",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Electrician Services"),
//         backgroundColor: Colors.red,
//       ),
//       body: ListView.builder(
//         itemCount: electricianServices.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(electricianServices[index]),
//             leading: Icon(Icons.electrical_services, color: Colors.red),
//           );
//         },
//       ),
//     );
//   }
// }


///fhdsakfhwsikhflwqyhfoiwerghf3owieyfrpoiwquhgerfliwhf qehwfouiheuoihfvewhyf
// import 'package:flutter/material.dart';

// class EmergencyScreen extends StatelessWidget {
//   const EmergencyScreen({super.key});

//   final List<Map<String, dynamic>> services = const [
//     {"icon": Icons.tap_and_play, "title": "Plumber"},
//     // {"icon": Icons.construction, "title": "Labor"},
//     {"icon": Icons.electrical_services, "title": "Electrician"},
//     // {"icon": Icons.kitchen, "title": "Appliances"},
//     // {"icon": Icons.videocam, "title": "CCTV"},
//     // {"icon": Icons.format_paint, "title": "Painting"},
//     // {"icon": Icons.carpenter, "title": "Carpenter"},
//     // {"icon": Icons.bug_report, "title": "Pest Control"},
//     // {"icon": Icons.girl, "title": "Wall Panelling"},
//     // {"icon": Icons.wallpaper, "title": "Wall Panelling"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Emergency Services"),
//         backgroundColor: Colors.red,
//       ),
//       body: ListView.separated(
//         padding: const EdgeInsets.all(12),
//         itemCount: services.length,
//         itemBuilder: (context, index) {
//           final service = services[index];
//           return ListTile(
//             leading: Icon(service["icon"], color: Colors.red),
//             title: Text(
//               service["title"],
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             trailing: Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: () {
//               if (service["title"] == "Plumber") {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => PlumberServicesPage()),
//                 );
//               } else if (service["title"] == "Electrician") {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => ElectricianServicesPage()),
//                 );
//               } else {
//                 showDialog(
//                   context: context,
//                   builder:
//                       (_) => AlertDialog(
//                         title: Text(service["title"]),
//                         content: Text(
//                           "You tapped on ${service["title"]} (Emergency)",
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () => Navigator.pop(context),
//                             child: Text("OK"),
//                           ),
//                         ],
//                       ),
//                 );
//               }
//             },
//           );
//         },
//         separatorBuilder: (context, index) => Divider(),
//       ),
//     );
//   }
// }

// // ------------------ PLUMBER SECTION ------------------

// class PlumberServicesPage extends StatelessWidget {
//   final List<String> plumberServices = const [
//     "Washbasin Repair",
//     "Tap Leakage Fix",
//     "Toilet Installation",
//     "Drain Cleaning",
//     "Pipe Blockage",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Plumber Services"),
//         backgroundColor: Colors.red,
//       ),
//       body: ListView.builder(
//         itemCount: plumberServices.length,
//         itemBuilder: (context, index) {
//           final serviceName = plumberServices[index];
//           return ListTile(
//             title: Text(serviceName),
//             leading: Icon(Icons.build, color: Colors.red),
//             trailing: Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder:
//                       (_) =>
//                           PlumberSubServiceDetailPage(serviceName: serviceName),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class PlumberSubServiceDetailPage extends StatelessWidget {
//   final String serviceName;

//   const PlumberSubServiceDetailPage({super.key, required this.serviceName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(serviceName), backgroundColor: Colors.red),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Text(
//             "$serviceName Your Request was Successfully Sent!",
//             style: TextStyle(fontSize: 18),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ------------------ ELECTRICIAN SECTION ------------------

// class ElectricianServicesPage extends StatelessWidget {
//   final List<String> electricianServices = const [
//     "Board Repair",
//     "Short Circuit Fix",
//     "Light Installation",
//     "Fan Repair",
//     "Switch Replacement",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Electrician Services"),
//         backgroundColor: Colors.red,
//       ),
//       body: ListView.builder(
//         itemCount: electricianServices.length,
//         itemBuilder: (context, index) {
//           final serviceName = electricianServices[index];
//           return ListTile(
//             title: Text(serviceName),
//             leading: Icon(Icons.electrical_services, color: Colors.red),
//             trailing: Icon(Icons.arrow_forward_ios, size: 16),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder:
//                       (_) => ElectricianSubServiceDetailPage(
//                         serviceName: serviceName,
//                       ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class ElectricianSubServiceDetailPage extends StatelessWidget {
//   final String serviceName;

//   const ElectricianSubServiceDetailPage({super.key, required this.serviceName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(serviceName), backgroundColor: Colors.red),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Text(
//             "$serviceName Details and Booking Info Coming Soon!",
//             style: TextStyle(fontSize: 18),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }






















//s dfsh eriogherwgh ewo ;tuer; t9u3 60t8 53466 83- 0560t8 

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:geocoding/geocoding.dart';

// import 'package:skill_link/pages/Apis.dart';
// import 'package:skill_link/pages/Emergency/plumberProfilePage.dart';
// import 'package:skill_link/pages/userservice/plumbermodel.dart';

// class EmergencyScreen extends StatefulWidget {
//   @override
//   State<EmergencyScreen> createState() => _EmergencyScreenState();
// }

// class _EmergencyScreenState extends State<EmergencyScreen> {
//   List<Plumber> _plumbers = [];
//   bool _loading = false;
//   Position? _userPosition;

//   final List<Map<String, dynamic>> services = [
//     {"icon": Icons.plumbing, "title": "Plumber"},
//     {"icon": Icons.electrical_services, "title": "Electrician"},
//   ];

//   final List<String> plumberServices = const [
//     "Washbasin Repair",
//     "Tap Leakage Fix",
//     "Toilet Installation",
//     "Drain Cleaning",
//     "Pipe Blockage",
//   ];

//   Future<void> _handleServiceTap(
//       BuildContext context, String serviceName) async {
//     if (serviceName != "Plumber") {
//       if (!mounted) return;
//       _showError('Service "$serviceName" not implemented yet.');
//       return;
//     }

//     setState(() => _loading = true);

//     try {
//       _userPosition = await _determinePosition(context);
//       await fetchNearbyPlumbers();

//       if (!mounted) return;

//       final groupedPlumbers = groupPlumbersByService(_plumbers);

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) => PlumberProfilesByServicePage(
//             groupedPlumbers: groupedPlumbers,
//             latitude: _userPosition!.latitude,
//             longitude: _userPosition!.longitude,
//           ),
//         ),
//       );
//     } catch (e) {
//       print('❌ _handleServiceTap error: $e');
//       if (mounted) {
//         _showError('Something went wrong. Please try again.');
//       }
//     } finally {
//       if (mounted) {
//         setState(() => _loading = false);
//       }
//     }
//   }

//   Map<String, List<Plumber>> groupPlumbersByService(List<Plumber> plumbers) {
//     final Map<String, List<Plumber>> grouped = {};

//     for (String service in plumberServices) {
//       grouped[service] = plumbers.where((plumber) {
//         return plumber.services.contains(service);
//       }).toList();
//     }

//     return grouped;
//   }

//   Future<void> fetchNearbyPlumbers() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('bearer_token');
//       final userId = prefs.getInt('user_id');

//       if (token == null || token.isEmpty || userId == null) {
//         if (mounted) _showError('Authentication failed. Please login again.');
//         print('⚠️ Missing token or user ID');
//         return;
//       }

//       final response = await http.get(
//         Uri.parse('$baseUrl/api/profile'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Accept': 'application/json',
//         },
//       );

//       print('📡 GET /profile status: ${response.statusCode}');

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final List<dynamic> allProfiles = data['data'];

//         List<Plumber> nearby = [];

//         for (var profile in allProfiles) {
//           if (profile['role'] == 'plumber' && profile['service_area'] != null) {
//             try {
//               List<Location> locations =
//                   await locationFromAddress(profile['service_area']);
//               if (locations.isNotEmpty) {
//                 double distance = Geolocator.distanceBetween(
//                   _userPosition!.latitude,
//                   _userPosition!.longitude,
//                   locations.first.latitude,
//                   locations.first.longitude,
//                 );

//                 if (distance <= 5000) {
//                   // Fix image if it's not full URL
//                   if (profile['image'] != null &&
//                       !profile['image'].toString().startsWith('http')) {
//                     profile['plumber_image'] =
//                         '$baseUrl/uploads/plumber_image/${profile['image']}';
//                   } else {
//                     profile['plumber_image'] = profile['image'];
//                   }

//                   // Convert 'skill' to 'services'
//                   if (profile.containsKey('skill')) {
//                     profile['services'] = profile['skill'];
//                   }

//                   nearby.add(Plumber.fromJson(profile));
//                 }
//               }
//             } catch (e) {
//               print('⚠️ Location error for ${profile['service_area']}: $e');
//             }
//           }
//         }

//         if (mounted) {
//           setState(() {
//             _plumbers = nearby;
//           });
//         }
//       } else {
//         if (mounted) _showError('Server error: ${response.statusCode}');
//         print('❌ API response: ${response.body}');
//       }
//     } catch (e) {
//       print('❌ Exception in fetchNearbyPlumbers: $e');
//       if (mounted) _showError('Failed to fetch plumbers.');
//     }
//   }

//   Future<Position> _determinePosition(BuildContext context) async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) throw Exception('Location services are disabled.');

//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         throw Exception('Location permission denied.');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       throw Exception('Location permission permanently denied.');
//     }

//     return await Geolocator.getCurrentPosition();
//   }

//   void _showError(String message) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Emergency Services'),
//         backgroundColor: Colors.red,
//       ),
//       body: _loading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.separated(
//               itemCount: services.length,
//               separatorBuilder: (context, index) => Divider(),
//               itemBuilder: (context, index) {
//                 final service = services[index];
//                 return ListTile(
//                   leading: Icon(service['icon'] as IconData, color: Colors.red),
//                   title: Text(service['title']),
//                   trailing: Icon(Icons.arrow_forward_ios, size: 16),
//                   onTap: () => _handleServiceTap(context, service['title']),
//                 );
//               },
//             ),
//     );
//   }
// }


// yai code sirf emergency.dart file ke liye hai,
// isme emergency services ka implementation hai. 
//Ye code plumber aur electrician services ko handle karta hai
//, user ki current location leke nearby plumbers ko fetch karta hai,
// aur unhe group karke display karta hai. Agar koi service select ki jati hai,
// to confirmation page par navigate karta hai. Isme error handling
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:geocoding/geocoding.dart';

// import 'package:skill_link/pages/Apis.dart';
// import 'package:skill_link/pages/Emergency/Conformation.dart';
// import 'package:skill_link/pages/Emergency/plumberProfilePage.dart';
// import 'package:skill_link/pages/userservice/plumbermodel.dart';

// class EmergencyScreen extends StatefulWidget {
//   @override
//   State<EmergencyScreen> createState() => _EmergencyScreenState();
// }

// class _EmergencyScreenState extends State<EmergencyScreen> {
//   List<Plumber> _plumbers = [];
//   bool _loading = false;

//   final List<Map<String, dynamic>> services = [
//     {"icon": Icons.plumbing, "title": "Plumber"},
//     {"icon": Icons.electrical_services, "title": "Electrician"},
//   ];

//   final List<String> plumberServices = const [
//     "Washbasin Repair",
//     "Tap Leakage Fix",
//     "Toilet Installation",
//     "Drain Cleaning",
//     "Pipe Blockage",
//   ];

//   /// 🧠 FIXED: Handles service selection safely
//   Future<void> _handleServiceTap(
//       BuildContext context, String serviceName) async {
//     if (serviceName != "Plumber") {
//       if (!mounted) return;
//       _showError('Service "$serviceName" not implemented yet.');
//       return;
//     }

//     setState(() => _loading = true);

//     try {
//       final position = await _determinePosition(context);
//       await fetchNearbyPlumbers(position); // Now handles navigation
//     } catch (e) {
//       if (!mounted) return;
//       _showError('Something went wrong. Please try again.');
//       print('❌ _handleServiceTap error: $e');
//     } finally {
//       if (mounted) setState(() => _loading = false);
//     }
//   }


//   /// ✅ Group plumbers by each service
//   Map<String, List<Plumber>> groupPlumbersByService(List<Plumber> plumbers) {
//     final Map<String, List<Plumber>> grouped = {};
//     for (String service in plumberServices) {
//       grouped[service] = plumbers.where((plumber) {
//         return plumber.services.contains(service);
//       }).toList();
//     }
//     return grouped;
//   }

//   /// ✅ Fetch plumbers and filter based on distance
//  Future<void> fetchNearbyPlumbers(Position position) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('bearer_token');
//       final userId = prefs.getInt('user_id');

//       if (token == null || token.isEmpty || userId == null) {
//         _showError('Authentication failed. Please login again.');
//         return;
//       }

//       final response = await http.get(
//         Uri.parse('$baseUrl/api/profile'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Accept': 'application/json',
//         },
//       );

//       print('📡 GET /profile status: ${response.statusCode}');

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final List<dynamic> allPlumbers = data['data'];

//         List<Plumber> nearby = [];

//         for (var profile in allPlumbers) {
//           if (profile['role'] == 'plumber' && profile['service_area'] != null) {
//             try {
//               List<Location> locations =
//                   await locationFromAddress(profile['service_area']);
//               if (locations.isNotEmpty) {
//                 double distance = Geolocator.distanceBetween(
//                   position.latitude,
//                   position.longitude,
//                   locations.first.latitude,
//                   locations.first.longitude,
//                 );

//                 if (distance <= 5000) {
//                   if (profile['plumber_image'] != null &&
//                       !profile['plumber_image'].toString().startsWith('http')) {
//                     profile['plumber_image'] =
//                         '$baseUrl/uploads/plumber_image/${profile['plumber_image']}';
//                   }

//                   nearby.add(Plumber.fromJson(profile));
//                 }
//               }
//             } catch (e) {
//               print('⚠️ Location error for ${profile['service_area']}: $e');
//             }
//           }
//         }

//         if (mounted) {
//           setState(() {
//             _plumbers = nearby;
//           });
//         }

//         if (nearby.isNotEmpty && mounted) {
//           final selectedPlumber = nearby.first;

//           Future.microtask(() {
//             if (!mounted) return;
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (_) => ConfirmationPage(
//                   plumber: selectedPlumber,
//                   latitude: position.latitude,
//                   longitude: position.longitude,
//                 ),
//               ),
//             );
//           });
//         } else {
//           _showError('No nearby plumbers found.');
//         }
//       } else {
//         _showError('Server error: ${response.statusCode}');
//       }
//     } catch (e) {
//       _showError('Failed to fetch plumbers.');
//       print('❌ Exception in fetchNearbyPlumbers: $e');
//     }
//   }


//   /// ✅ Get current position safely
//   Future<Position> _determinePosition(BuildContext context) async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) throw Exception('Location services are disabled.');

//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         throw Exception('Location permission denied.');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       throw Exception('Location permission permanently denied.');
//     }

//     return await Geolocator.getCurrentPosition();
//   }

//   /// ✅ Show snack bar error
//   void _showError(String message) {
//     if (mounted) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(message)));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Emergency Services'),
//         backgroundColor: Colors.red,
//       ),
//       body: _loading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.separated(
//               itemCount: services.length,
//               separatorBuilder: (context, index) => Divider(),
//               itemBuilder: (context, index) {
//                 final service = services[index];
//                 return ListTile(
//                   leading: Icon(service['icon'] as IconData, color: Colors.red),
//                   title: Text(service['title']),
//                   trailing: Icon(Icons.arrow_forward_ios, size: 16),
//                   onTap: () => _handleServiceTap(context, service['title']),
//                 );
//               },
//             ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:skill_link/pages/Apis.dart';
// import 'package:skill_link/pages/Emergency/plumberProfilePage.dart';
// import 'package:skill_link/pages/userservice/plumbermodel.dart';


// class EmergencyScreen extends StatefulWidget {
//   const EmergencyScreen({super.key});

//   @override
//   State<EmergencyScreen> createState() => _EmergencyScreenState();
// }

// class _EmergencyScreenState extends State<EmergencyScreen> {
//   bool _loading = false;
//   List<Map<String, dynamic>> plumberData = [];

//   late BuildContext safeContext; // ✅ Safe context reference

//   final List<Map<String, dynamic>> services = [
//     {'name': 'Plumber', 'icon': Icons.plumbing},
//     {'name': 'Electrician', 'icon': Icons.electrical_services},
//     {'name': 'Carpenter', 'icon': Icons.handyman},
//   ];

//   final List<String> plumberServices = [
//     'Tap Leakage Fix',
//     'Drain Cleaning',
//     'Toilet Repair',
//     'Pipe Blockage',
//     'Bathroom Fitting',
//     'Water Tank Cleaning',
//   ];

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     safeContext = context; // ✅ Assign safe context once
//   }

//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       _showError('Location services are disabled.');
//       throw Exception('Location disabled');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         _showError('Location permissions are denied');
//         throw Exception('Permission denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       _showError('Location permissions are permanently denied');
//       throw Exception('Permission denied forever');
//     }

//     return await Geolocator.getCurrentPosition();
//   }


// yai function accurate run hooo raha hi sirf profile show nhi hoo rahi
// Future<void> fetchNearbyPlumbers({
//     required String selectedService,
//     required Position position,
//   }) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('bearer_token');

//       if (token == null) {
//         _showError('Authentication token missing. Please log in again.');
//         return;
//       }

//       final response = await http.get(
//         Uri.parse('$baseUrl/api/profile'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Accept': 'application/json',
//         },
//       );

//       print('Status Code: ${response.statusCode}');
//       print('Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         final decoded = json.decode(response.body);

//         print("Decoded body type: ${decoded.runtimeType}");
//         print("Decoded body content: $decoded");

//         List<dynamic> data;

//         if (decoded is Map<String, dynamic> && decoded.containsKey('data')) {
//           data = decoded['data'];
//         } else {
//           _showError('Unexpected API response format.');
//           return;
//         }

//         final List<Map<String, dynamic>> filteredPlumbers = [];

//         for (var item in data) {
//           if (item is! Map<String, dynamic>) continue;

//           final role = item['role'];
//           final skill = item['skill']?.toString().toLowerCase() ?? '';
//           final serviceArea = item['service_area'];

//           if (role != 'plumber') continue;

//           if (!skill.contains(selectedService.toLowerCase())) continue;

//           // If service_area contains lat/lng map, extract them
//           if (serviceArea is Map<String, dynamic> &&
//               serviceArea['lat'] != null &&
//               serviceArea['lng'] != null) {
//             final double? plumberLat =
//                 double.tryParse(serviceArea['lat'].toString());
//             final double? plumberLng =
//                 double.tryParse(serviceArea['lng'].toString());

//             if (plumberLat == null || plumberLng == null) continue;

//             final double distance = Geolocator.distanceBetween(
//               position.latitude,
//               position.longitude,
//               plumberLat,
//               plumberLng,
//             );

//             if (distance > 10000) continue; // Skip if too far
//           }

//           filteredPlumbers.add(Map<String, dynamic>.from(item));
//         }

//         print("Matched Plumbers: ${filteredPlumbers.length}");

//         if (!mounted) return;
//         setState(() {
//           plumberData = filteredPlumbers;
//         });
//       } else {
//         _showError('Failed to fetch data. Status code: ${response.statusCode}');
//       }
//     } catch (e, stackTrace) {
//       print('Error fetching plumbers: $e');
//       print(stackTrace);
//       if (mounted) {
//         _showError('Exception: ${e.toString()}');
//       }
//     }
//   }


// Future<void> fetchNearbyPlumbers({
//   required String selectedService,
//   required Position position,
//   required BuildContext context,
// }) async {
//   try {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('bearer_token');

//     if (token == null) {
//       _showError( 'Authentication token missing. Please log in again.');
//       return;
//     }

//     final response = await http.get(
//       Uri.parse('$baseUrl/api/profile'),
//       headers: {
//         'Authorization': 'Bearer $token',
//         'Accept': 'application/json',
//       },
//     );

//     if (response.statusCode != 200) {
//       _showError( 'Failed to fetch data. Status: ${response.statusCode}');
//       return;
//     }

//     final decoded = json.decode(response.body);
//     List<dynamic> data;

//     if (decoded is Map<String, dynamic> && decoded.containsKey('data')) {
//       data = decoded['data'];
//     } else {
//       _showError( 'Unexpected API response format.');
//       return;
//     }

//     final List<Map<String, dynamic>> matchedPlumbers = [];

//     for (var item in data) {
//       if (item is! Map<String, dynamic>) continue;
//       final role = item['role'];
//       final skillRaw = item['skill'];
//       final serviceAreaRaw = item['service_area'];

//       if (role != 'plumber') continue;

//       List<String> skills = [];
//       if (skillRaw is String) {
//         skills = skillRaw.split(',').map((s) => s.trim().toLowerCase()).toList();
//       } else if (skillRaw is List) {
//         skills = skillRaw.map((s) => s.toString().trim().toLowerCase()).toList();
//       }

//       if (!skills.contains(selectedService.toLowerCase())) continue;

//       double? lat;
//       double? lng;

//       if (serviceAreaRaw is Map<String, dynamic>) {
//         lat = double.tryParse(serviceAreaRaw['lat']?.toString() ?? '');
//         lng = double.tryParse(serviceAreaRaw['lng']?.toString() ?? '');
//       } else if (serviceAreaRaw is String) {
//         final coords = await geocodeAddress(serviceAreaRaw);
//         if (coords != null) {
//           lat = coords.latitude;
//           lng = coords.longitude;
//         }
//       }

//       if (lat != null && lng != null) {
//         final distanceMeters = Geolocator.distanceBetween(
//           position.latitude,
//           position.longitude,
//           lat,
//           lng,
//         );

//         if (distanceMeters <= 5000) {
//           matchedPlumbers.add(Map<String, dynamic>.from(item));
//         }
//       }
//     }

//     if (matchedPlumbers.isEmpty) {
//       _showError( 'No plumbers found within 5km matching "$selectedService".');
//       return;
//     }

//     Map<String, List<Plumber>> grouped = {};
//     for (var plumberMap in matchedPlumbers) {
//       Plumber plumber = Plumber.fromJson(plumberMap);
//       for (var service in plumber.services) {
//         grouped.putIfAbsent(service, () => []);
//         grouped[service]!.add(plumber);
//       }
//     }

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => PlumberProfilesByServicePage(
//           groupedPlumbers: grouped,
//           latitude: position.latitude,
//           longitude: position.longitude,
//         ),
//       ),
//     );
//   } catch (e, stack) {
//     print('❌ Exception: $e');
//     print(stack);
//     _showError( 'Error occurred: ${e.toString()}');
//   }
// }

//   void _showError(String message) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(safeContext).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   void _handleServiceTap(String serviceName) {
//     if (serviceName == "Plumber") {
//       _showPlumberServiceSelection();
//     } else {
//       _showError('Service "$serviceName" not implemented yet.');
//     }
//   }

//   void _showPlumberServiceSelection() {
//     showModalBottomSheet(
//       context: context,
//       builder: (bottomSheetContext) {
//         return ListView.builder(
//           shrinkWrap: true,
//           itemCount: plumberServices.length,
//           itemBuilder: (context, index) {
//             final service = plumberServices[index];
//             return ListTile(
//               title: Text(service),
//               onTap: () async {
//                 Navigator.pop(bottomSheetContext);
//                 if (!mounted) return;
//                 setState(() => _loading = true);
//                 try {
//                   final position = await _determinePosition();
//                   if (!mounted) return;
//                   await fetchNearbyPlumbers(
//                     selectedService: service,
//                     position: position,
//                   );
//                 } catch (e) {
//                   if (mounted) {
//                     _showError('Something went wrong. Please try again.');
//                   }
//                 } finally {
//                   if (mounted) setState(() => _loading = false);
//                 }
//               },
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Select a Service'),
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//       ),
//       body: _loading
//           ? const Center(child: CircularProgressIndicator())
//           : GridView.count(
//               crossAxisCount: 2,
//               childAspectRatio: 1,
//               padding: const EdgeInsets.all(16),
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//               children: services.map((service) {
//                 return GestureDetector(
//                   onTap: () => _handleServiceTap(service['name']),
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     elevation: 4,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(service['icon'], size: 48),
//                         const SizedBox(height: 8),
//                         Text(service['name'],
//                             style: const TextStyle(fontSize: 16))
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//     );
//   }
// }







// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:skill_link/pages/Apis.dart';
// import 'package:skill_link/pages/Emergency/plumberProfilePage.dart';
// import 'package:skill_link/pages/userservice/plumbermodel.dart';

// class EmergencyScreen extends StatefulWidget {
//   const EmergencyScreen({super.key});

//   @override
//   State<EmergencyScreen> createState() => _EmergencyScreenState();
// }

// class _EmergencyScreenState extends State<EmergencyScreen> {
//   bool _loading = false;
//   List<Map<String, dynamic>> plumberData = [];
//   late BuildContext safeContext;

//   final List<Map<String, dynamic>> services = [
//     {'name': 'Plumber', 'icon': Icons.plumbing},
//     {'name': 'Electrician', 'icon': Icons.electrical_services},
//     {'name': 'Carpenter', 'icon': Icons.handyman},
//   ];

//   final List<String> plumberServices = [
//     'Tap Leakage Fix',
//     'Drain Cleaning',
//     'Toilet Repair',
//     'Pipe Blockage',
//     'Bathroom Fitting',
//     'Water Tank Cleaning',
//   ];

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     safeContext = context;
//   }

//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       _showError('Location services are disabled.');
//       throw Exception('Location disabled');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         _showError('Location permissions are denied');
//         throw Exception('Permission denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       _showError('Location permissions are permanently denied');
//       throw Exception('Permission denied forever');
//     }

//     return await Geolocator.getCurrentPosition();
//   }

//   Future<Position?> geocodeAddress(String address) async {
//     try {
//       final url = Uri.parse(
//           'https://nominatim.openstreetmap.org/search?q=$address&format=json');
//       final response = await http.get(url, headers: {
//         'User-Agent': 'FlutterApp',
//       });

//       if (response.statusCode == 200) {
//         final List data = json.decode(response.body);
//         if (data.isNotEmpty) {
//           final firstResult = data[0];
//           final lat = double.tryParse(firstResult['lat']);
//           final lon = double.tryParse(firstResult['lon']);
//           if (lat != null && lon != null) {
//             return Position(
//               latitude: lat,
//               longitude: lon,
//               accuracy: 0,
//               altitude: 0,
//               altitudeAccuracy: 0,
//               heading: 0,
//               headingAccuracy: 0,
//               speed: 0,
//               speedAccuracy: 0,
//               timestamp: DateTime.now(),
//               isMocked: true,
//             );
//           }
//         }
//       } else {
//         print('❌ Geocoding failed: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('❌ Geocoding exception: $e');
//     }
//     return null;
//   }

//   Future<void> fetchNearbyPlumbers({
//     required String selectedService,
//     required Position position,
//   }) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('bearer_token');

//       if (token == null) {
//         _showError('Authentication token missing. Please log in again.');
//         return;
//       }

//       final response = await http.get(
//         Uri.parse('$baseUrl/api/profile'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Accept': 'application/json',
//         },
//       );

//       if (response.statusCode != 200) {
//         _showError('Failed to fetch data. Status: ${response.statusCode}');
//         return;
//       }

//       final decoded = json.decode(response.body);
//       List<dynamic> data;

//       if (decoded is Map<String, dynamic> && decoded.containsKey('data')) {
//         data = decoded['data'];
//       } else {
//         _showError('Unexpected API response format.');
//         return;
//       }

//       final List<Map<String, dynamic>> matchedPlumbers = [];

//       for (var item in data) {
//         if (item is! Map<String, dynamic>) continue;
//         final role = item['role'];
//         final skillRaw = item['skill'];
//         final serviceAreaRaw = item['service_area'];

//         if ((role?.toString().toLowerCase() ?? '') != 'plumber') continue;

//         List<String> skills = [];
//         if (skillRaw is String) {
//           skills =
//               skillRaw.split(',').map((s) => s.trim().toLowerCase()).toList();
//         } else if (skillRaw is List) {
//           skills =
//               skillRaw.map((s) => s.toString().trim().toLowerCase()).toList();
//         }

//         if (!skills.contains(selectedService.toLowerCase())) continue;

//         double? lat;
//         double? lng;

//         if (serviceAreaRaw is Map<String, dynamic>) {
//           lat = double.tryParse(serviceAreaRaw['lat']?.toString() ?? '');
//           lng = double.tryParse(serviceAreaRaw['lng']?.toString() ?? '');
//         } else if (serviceAreaRaw is String) {
//           final coords = await geocodeAddress(serviceAreaRaw);
//           if (coords != null) {
//             lat = coords.latitude;
//             lng = coords.longitude;
//           }
//         }

//         if (lat != null && lng != null) {
//           final distanceMeters = Geolocator.distanceBetween(
//             position.latitude,
//             position.longitude,
//             lat,
//             lng,
//           );

//           if (distanceMeters <= 5000) {
//             matchedPlumbers.add(Map<String, dynamic>.from(item));
//           }
//         }
//       }

//       if (matchedPlumbers.isEmpty) {
//         _showError('No plumbers found within 5km matching "$selectedService".');
//         return;
//       }

//       Map<String, List<Plumber>> grouped = {};
//       for (var plumberMap in matchedPlumbers) {
//         Plumber plumber = Plumber.fromJson(plumberMap);
//         for (var service in plumber.services) {
//           grouped.putIfAbsent(service, () => []);
//           grouped[service]!.add(plumber);
//         }
//       }

//       if (!mounted) return;

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) => PlumberProfilesByServicePage(
//             groupedPlumbers: grouped,
//             latitude: position.latitude,
//             longitude: position.longitude,
//           ),
//         ),
//       );
//     } catch (e, stack) {
//       print('❌ Exception: $e');
//       print(stack);
//       _showError('Error occurred: ${e.toString()}');
//     }
//   }

//   void _showError(String message) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(safeContext).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   void _handleServiceTap(String serviceName) {
//     if (serviceName == "Plumber") {
//       _showPlumberServiceSelection();
//     } else {
//       _showError('Service "$serviceName" not implemented yet.');
//     }
//   }

//   void _showPlumberServiceSelection() {
//     showModalBottomSheet(
//       context: context,
//       builder: (bottomSheetContext) {
//         return ListView.builder(
//           shrinkWrap: true,
//           itemCount: plumberServices.length,
//           itemBuilder: (context, index) {
//             final service = plumberServices[index];
//             return ListTile(
//               title: Text(service),
//               onTap: () async {
//                 Navigator.pop(bottomSheetContext);
//                 if (!mounted) return;
//                 setState(() => _loading = true);
//                 try {
//                   final position = await _determinePosition();
//                   if (!mounted) return;
//                   await fetchNearbyPlumbers(
//                     selectedService: service,
//                     position: position,
//                   );
//                 } catch (e) {
//                   if (mounted) {
//                     _showError('Something went wrong. Please try again.');
//                   }
//                 } finally {
//                   if (mounted) setState(() => _loading = false);
//                 }
//               },
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Select Emergency Service'),
//         backgroundColor: Colors.red,
//         foregroundColor: Colors.white,
//       ),
//      body: _loading
//             ? const Center(child: CircularProgressIndicator())
//             : GridView.count(
//                 crossAxisCount: 2,
//                 childAspectRatio: 1,
//                 padding: const EdgeInsets.all(16),
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//                 children: services.map((service) {
//                   return GestureDetector(
//                     onTap: () => _handleServiceTap(service['name']),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color:
//                             Colors.red[50], // light background for visibility
//                         borderRadius: BorderRadius.circular(16),
//                         border: Border.all(color: Colors.redAccent, width: 1.5),
//                       ),
//                       padding: const EdgeInsets.all(12),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(service['icon'],
//                               size: 48, color: Colors.redAccent),
//                           const SizedBox(height: 8),
//                           Text(
//                             service['name'],
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               )

//     );
//   }
// }






import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_link/pages/Apis.dart';
import 'package:skill_link/pages/Emergency/plumberProfilePage.dart';
import 'package:skill_link/pages/userservice/plumbermodel.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  bool _loading = false;
  List<Map<String, dynamic>> plumberData = [];
  late BuildContext safeContext;

  final Map<String, List<String>> serviceCategories = {
    'Plumber': [
      'Tap Leakage Fix',
      'Drain Cleaning',
      'Toilet Repair',
      'Pipe Blockage',
      'Bathroom Fitting',
      'Water Tank Cleaning',
    ],
    'Electrician': [
      'Wiring Repair',
      'Fan Installation',
      'Light Fitting',
      'Short Circuit Fix',
    ],
    'Carpenter': [
      'Furniture Repair',
      'Door Installation',
      'Wardrobe Setup',
      'Wooden Flooring',
    ],
  };

  Set<String> expandedServices = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    safeContext = context;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showError('Location services are disabled.');
      throw Exception('Location disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showError('Location permissions are denied');
        throw Exception('Permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showError('Location permissions are permanently denied');
      throw Exception('Permission denied forever');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<Position?> geocodeAddress(String address) async {
    try {
      final url = Uri.parse(
          'https://nominatim.openstreetmap.org/search?q=$address&format=json');
      final response = await http.get(url, headers: {
        'User-Agent': 'FlutterApp',
      });

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        if (data.isNotEmpty) {
          final firstResult = data[0];
          final lat = double.tryParse(firstResult['lat']);
          final lon = double.tryParse(firstResult['lon']);
          if (lat != null && lon != null) {
            return Position(
              latitude: lat,
              longitude: lon,
              accuracy: 0,
              altitude: 0,
              altitudeAccuracy: 0,
              heading: 0,
              headingAccuracy: 0,
              speed: 0,
              speedAccuracy: 0,
              timestamp: DateTime.now(),
              isMocked: true,
            );
          }
        }
      }
    } catch (e) {
      print('❌ Geocoding exception: $e');
    }
    return null;
  }

  Future<void> fetchNearbyPlumbers({
    required String selectedService,
    required Position position,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('bearer_token');

      if (token == null) {
        _showError('Authentication token missing. Please log in again.');
        return;
      }

      final response = await http.get(
        Uri.parse('$baseUrl/api/profile'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        _showError('Failed to fetch data. Status: ${response.statusCode}');
        return;
      }

      final decoded = json.decode(response.body);
      List<dynamic> data;

      if (decoded is Map<String, dynamic> && decoded.containsKey('data')) {
        data = decoded['data'];
      } else {
        _showError('Unexpected API response format.');
        return;
      }

      final List<Map<String, dynamic>> matchedPlumbers = [];

      for (var item in data) {
        if (item is! Map<String, dynamic>) continue;
        final role = item['role'];
        final skillRaw = item['skill'];
        final serviceAreaRaw = item['service_area'];

        if ((role?.toString().toLowerCase() ?? '') != 'plumber') continue;

        List<String> skills = [];
        if (skillRaw is String) {
          skills =
              skillRaw.split(',').map((s) => s.trim().toLowerCase()).toList();
        } else if (skillRaw is List) {
          skills =
              skillRaw.map((s) => s.toString().trim().toLowerCase()).toList();
        }

        if (!skills.contains(selectedService.toLowerCase())) continue;

        double? lat;
        double? lng;

        if (serviceAreaRaw is Map<String, dynamic>) {
          lat = double.tryParse(serviceAreaRaw['lat']?.toString() ?? '');
          lng = double.tryParse(serviceAreaRaw['lng']?.toString() ?? '');
        } else if (serviceAreaRaw is String) {
          final coords = await geocodeAddress(serviceAreaRaw);
          if (coords != null) {
            lat = coords.latitude;
            lng = coords.longitude;
          }
        }

        if (lat != null && lng != null) {
          final distanceMeters = Geolocator.distanceBetween(
            position.latitude,
            position.longitude,
            lat,
            lng,
          );

          if (distanceMeters <= 5000) {
            matchedPlumbers.add(Map<String, dynamic>.from(item));
          }
        }
      }

      if (matchedPlumbers.isEmpty) {
        _showError('No plumbers found within 5km matching "$selectedService".');
        return;
      }

      Map<String, List<Plumber>> grouped = {};
      for (var plumberMap in matchedPlumbers) {
        Plumber plumber = Plumber.fromJson(plumberMap);
        for (var service in plumber.services) {
          grouped.putIfAbsent(service, () => []);
          grouped[service]!.add(plumber);
        }
      }

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PlumberProfilesByServicePage(
            groupedPlumbers: grouped,
            latitude: position.latitude,
            longitude: position.longitude,
          ),
        ),
      );
    } catch (e, stack) {
      print('❌ Exception: $e');
      print(stack);
      _showError('Error occurred: ${e.toString()}');
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(safeContext).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _handleSubServiceTap(String serviceName, String subService) async {
    if (serviceName != "Plumber") {
      _showError('"$serviceName" support coming soon.');
      return;
    }

    setState(() => _loading = true);
    try {
      final position = await _determinePosition();
      if (!mounted) return;
      await fetchNearbyPlumbers(
        selectedService: subService,
        position: position,
      );
    } catch (e) {
      if (mounted) {
        _showError('Something went wrong. Please try again.');
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Emergency Service'),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: serviceCategories.entries.map((entry) {
                final service = entry.key;
                final subServices = entry.value;
                final isExpanded = expandedServices.contains(service);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        service,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(
                        isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: Colors.black,
                      ),
                      onTap: () {
                        setState(() {
                          if (isExpanded) {
                            expandedServices.remove(service);
                          } else {
                            expandedServices.add(service);
                          }
                        });
                      },
                    ),
                    if (isExpanded)
                      ...subServices.map((subService) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: ListTile(
                            title: Text(subService),
                            onTap: () => _handleSubServiceTap(service, subService),
                          ),
                        );
                      }).toList(),
                    const Divider(thickness: 1),
                  ],
                );
              }).toList(),
            ),
    );
  }
}
