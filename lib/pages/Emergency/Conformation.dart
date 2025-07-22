// import 'package:flutter/material.dart';
// import 'package:skill_link/pages/userservice/plumbermodel.dart';


// class ConfirmationPage extends StatelessWidget {
//   final Plumber plumber;
//   final double latitude;
//   final double longitude;

//   const ConfirmationPage({
//     Key? key,
//     required this.plumber,
//     required this.latitude,
//     required this.longitude,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Confirm Booking'),
//         backgroundColor: Colors.red,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             if (plumber.plumberImage != null)
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(plumber.plumberImage!),
//               ),
//             SizedBox(height: 16),
//             Text(plumber.fullName,
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text('Experience: ${plumber.experience}'),
//             Text('Rate: \$${plumber.hourlyRate.toStringAsFixed(2)}'),
//             Text('Service Area: ${plumber.serviceArea ?? 'N/A'}'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('✅ Booking Confirmed!')),
//                 );
//                 Navigator.pop(context);
//               },
//               child: Text('Confirm Booking'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:skill_link/pages/userservice/plumbermodel.dart';

class ConfirmationPage extends StatelessWidget {
  final Plumber plumber;
  final double latitude;
  final double longitude;

  const ConfirmationPage({
    Key? key,
    required this.plumber,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Debug: Print plumber image URL
    print('📷 plumber.plumberImage = ${plumber.plumberImage}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Booking'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ✅ Show image if available and valid, else fallback to placeholder
            CircleAvatar(
              radius: 50,
              backgroundImage: plumber.plumberImage != null &&
                      plumber.plumberImage!.startsWith('http')
                  ? NetworkImage(plumber.plumberImage!)
                  : AssetImage('assets/images/placeholder.png')  // Use a local placeholder image
                      as ImageProvider,
              onBackgroundImageError: (error, stackTrace) {
                print('⚠️ Image load failed: $error');
              },
            ),
            SizedBox(height: 16),
            Text(
              plumber.fullName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Experience: ${plumber.experience ?? "N/A"}'),
            Text('Rate: \$${plumber.hourlyRate?.toStringAsFixed(2) ?? "0.00"}'),
            Text('Service Area: ${plumber.serviceArea ?? 'N/A'}'),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('✅ Booking Confirmed!')),
                );
                Navigator.pop(context);
              },
              child: Text('Confirm Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
