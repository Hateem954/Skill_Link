import 'package:flutter/material.dart';

class SelectPlumberPage extends StatelessWidget {
  final List<Map<String, dynamic>> plumbers;
  final double latitude;
  final double longitude;
  final String selectedService; // ✅ Add this

  const SelectPlumberPage({
    Key? key,
    required this.plumbers,
    required this.latitude,
    required this.longitude,
    required this.selectedService, // ✅ Include it in constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Plumbers for $selectedService'), // Optional use
        backgroundColor: Colors.blue,
      ),
      body: plumbers.isEmpty
          ? const Center(child: Text('No plumbers found.'))
          : ListView.builder(
              itemCount: plumbers.length,
              itemBuilder: (context, index) {
                final plumber = plumbers[index];
                return ListTile(
                  title: Text(plumber['full_name'] ?? 'Unknown'),
                  subtitle: Text(plumber['experience'] ?? 'No experience info'),
                  trailing: Text('\$${plumber['hourly_rate'] ?? '0.0'}/hr'),
                  onTap: () {
                    // Handle plumber tap if needed
                  },
                );
              },
            ),
    );
  }
}
