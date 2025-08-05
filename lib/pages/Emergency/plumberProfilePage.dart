// import 'package:flutter/material.dart';
// import 'package:skill_link/pages/Emergency/Conformation.dart';
// import 'package:skill_link/pages/userservice/plumbermodel.dart';

// class PlumberProfilesByServicePage extends StatelessWidget {
//   final Map<String, List<Plumber>> groupedPlumbers;
//   final double latitude;
//   final double longitude;

//   const PlumberProfilesByServicePage({
//     Key? key,
//     required this.groupedPlumbers,
//     required this.latitude,
//     required this.longitude,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final nonEmptyGroups = groupedPlumbers.entries
//         .where((entry) => entry.value.isNotEmpty)
//         .toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Available Plumbers'),
//         backgroundColor: Colors.red,
//       ),
//       body: nonEmptyGroups.isEmpty
//           ? const Center(child: Text('No nearby plumbers available.'))
//           : ListView.builder(
//               itemCount: nonEmptyGroups.length,
//               itemBuilder: (context, index) {
//                 final service = nonEmptyGroups[index].key;
//                 final plumbers = nonEmptyGroups[index].value;

//                 return ExpansionTile(
//                   title: Text(service,
//                       style: const TextStyle(fontWeight: FontWeight.bold)),
//                   children: plumbers.map((plumber) {
//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: plumber.plumberImage != null
//                             ? NetworkImage(plumber.plumberImage!)
//                             : null,
//                         child: plumber.plumberImage == null
//                             ? const Icon(Icons.person)
//                             : null,
//                       ),
//                       title: Text(plumber.fullName),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                               'Rate: \$${plumber.hourlyRate.toStringAsFixed(2)}'),
//                           if (plumber.services.isNotEmpty)
//                             Text('Services: ${plumber.services.join(", ")}'),
//                         ],
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => ConfirmationPage(
//                               plumber: plumber,
//                               latitude: latitude,
//                               longitude: longitude,
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 );
//               },
//             ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:skill_link/pages/Emergency/Conformation.dart';
import 'package:skill_link/pages/userservice/plumbermodel.dart';

class PlumberProfilesByServicePage extends StatelessWidget {
  final Map<String, List<Plumber>> groupedPlumbers;
  final double latitude;
  final double longitude;

  const PlumberProfilesByServicePage({
    Key? key,
    required this.groupedPlumbers,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedServices = groupedPlumbers.keys.join(', ');
    final allPlumbers = groupedPlumbers.values.expand((list) => list).toList();

    final Color emergencyBackground = const Color(0xFFB71C1C); // Dark red
    final Color cardTextColor = Colors.black87;
    final Color highlightColor = Colors.redAccent;

    return Scaffold(
      backgroundColor: emergencyBackground,
      appBar: AppBar(
        title: Text(
          selectedServices,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: allPlumbers.isEmpty
          ? const Center(
              child: Text(
                'No nearby emergency plumbers available.',
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: allPlumbers.length,
              itemBuilder: (context, index) {
                final plumber = allPlumbers[index];
                return Card(
                  color: Colors.white,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ConfirmationPage(
                            plumber: plumber,
                            latitude: latitude,
                            longitude: longitude,
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[200],
                      child: ClipOval(
                        child: Image.network(
                          plumber.plumberImage ?? '',
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
                      plumber.fullName,
                      style: TextStyle(
                        color: cardTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${plumber.experience} years experience',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    trailing: Text(
                      'Rs:${plumber.hourlyRate}/hr',
                      style: TextStyle(
                        color: highlightColor,
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
