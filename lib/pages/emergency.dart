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

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geocoding/geocoding.dart';

import 'package:skill_link/pages/Apis.dart';
import 'package:skill_link/pages/Emergency/Conformation.dart';
import 'package:skill_link/pages/Emergency/plumberProfilePage.dart';
import 'package:skill_link/pages/userservice/plumbermodel.dart';

class EmergencyScreen extends StatefulWidget {
  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  List<Plumber> _plumbers = [];
  bool _loading = false;

  final List<Map<String, dynamic>> services = [
    {"icon": Icons.plumbing, "title": "Plumber"},
    {"icon": Icons.electrical_services, "title": "Electrician"},
  ];

  final List<String> plumberServices = const [
    "Washbasin Repair",
    "Tap Leakage Fix",
    "Toilet Installation",
    "Drain Cleaning",
    "Pipe Blockage",
  ];

  /// 🧠 FIXED: Handles service selection safely
  Future<void> _handleServiceTap(
      BuildContext context, String serviceName) async {
    if (serviceName != "Plumber") {
      if (!mounted) return;
      _showError('Service "$serviceName" not implemented yet.');
      return;
    }

    setState(() => _loading = true);

    try {
      final position = await _determinePosition(context);
      await fetchNearbyPlumbers(position); // Now handles navigation
    } catch (e) {
      if (!mounted) return;
      _showError('Something went wrong. Please try again.');
      print('❌ _handleServiceTap error: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }


  /// ✅ Group plumbers by each service
  Map<String, List<Plumber>> groupPlumbersByService(List<Plumber> plumbers) {
    final Map<String, List<Plumber>> grouped = {};
    for (String service in plumberServices) {
      grouped[service] = plumbers.where((plumber) {
        return plumber.services.contains(service);
      }).toList();
    }
    return grouped;
  }

  /// ✅ Fetch plumbers and filter based on distance
 Future<void> fetchNearbyPlumbers(Position position) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('bearer_token');
      final userId = prefs.getInt('user_id');

      if (token == null || token.isEmpty || userId == null) {
        _showError('Authentication failed. Please login again.');
        return;
      }

      final response = await http.get(
        Uri.parse('$baseUrl/api/profile'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      print('📡 GET /profile status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> allPlumbers = data['data'];

        List<Plumber> nearby = [];

        for (var profile in allPlumbers) {
          if (profile['role'] == 'plumber' && profile['service_area'] != null) {
            try {
              List<Location> locations =
                  await locationFromAddress(profile['service_area']);
              if (locations.isNotEmpty) {
                double distance = Geolocator.distanceBetween(
                  position.latitude,
                  position.longitude,
                  locations.first.latitude,
                  locations.first.longitude,
                );

                if (distance <= 5000) {
                  if (profile['plumber_image'] != null &&
                      !profile['plumber_image'].toString().startsWith('http')) {
                    profile['plumber_image'] =
                        '$baseUrl/uploads/plumber_image/${profile['plumber_image']}';
                  }

                  nearby.add(Plumber.fromJson(profile));
                }
              }
            } catch (e) {
              print('⚠️ Location error for ${profile['service_area']}: $e');
            }
          }
        }

        if (mounted) {
          setState(() {
            _plumbers = nearby;
          });
        }

        if (nearby.isNotEmpty && mounted) {
          final selectedPlumber = nearby.first;

          Future.microtask(() {
            if (!mounted) return;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ConfirmationPage(
                  plumber: selectedPlumber,
                  latitude: position.latitude,
                  longitude: position.longitude,
                ),
              ),
            );
          });
        } else {
          _showError('No nearby plumbers found.');
        }
      } else {
        _showError('Server error: ${response.statusCode}');
      }
    } catch (e) {
      _showError('Failed to fetch plumbers.');
      print('❌ Exception in fetchNearbyPlumbers: $e');
    }
  }


  /// ✅ Get current position safely
  Future<Position> _determinePosition(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw Exception('Location services are disabled.');

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }

  /// ✅ Show snack bar error
  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Services'),
        backgroundColor: Colors.red,
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: services.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final service = services[index];
                return ListTile(
                  leading: Icon(service['icon'] as IconData, color: Colors.red),
                  title: Text(service['title']),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => _handleServiceTap(context, service['title']),
                );
              },
            ),
    );
  }
}
