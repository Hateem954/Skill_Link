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
    final nonEmptyGroups = groupedPlumbers.entries
        .where((entry) => entry.value.isNotEmpty)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Plumbers'),
        backgroundColor: Colors.red,
      ),
      body: nonEmptyGroups.isEmpty
          ? const Center(child: Text('No nearby plumbers available.'))
          : ListView.builder(
              itemCount: nonEmptyGroups.length,
              itemBuilder: (context, index) {
                final service = nonEmptyGroups[index].key;
                final plumbers = nonEmptyGroups[index].value;

                return ExpansionTile(
                  title: Text(service,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  children: plumbers.map((plumber) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: plumber.plumberImage != null
                            ? NetworkImage(plumber.plumberImage!)
                            : null,
                        child: plumber.plumberImage == null
                            ? const Icon(Icons.person)
                            : null,
                      ),
                      title: Text(plumber.fullName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Rate: \$${plumber.hourlyRate.toStringAsFixed(2)}'),
                          if (plumber.services.isNotEmpty)
                            Text('Services: ${plumber.services.join(", ")}'),
                        ],
                      ),
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
                    );
                  }).toList(),
                );
              },
            ),
    );
  }
}
