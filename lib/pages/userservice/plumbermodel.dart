// class Plumber {
//   final int id;
//   final String fullName;
//   final String? plumberImage;
//   final int experience;
//   final int hourlyRate;
//   final double latitude;
//   final double longitude;

//   Plumber({
//     required this.id,
//     required this.fullName,
//     this.plumberImage,
//     required this.experience,
//     required this.hourlyRate,
//     required this.latitude,
//     required this.longitude,
//   });

//   factory Plumber.fromJson(Map<String, dynamic> json) {
//     return Plumber(
//       id: json['id'] is int
//           ? json['id']
//           : int.tryParse(json['id'].toString()) ?? 0,
//       fullName: json['full_name'] ?? '',
//       plumberImage: json['image'],
//       experience: json['experience'] is int
//           ? json['experience']
//           : int.tryParse(json['experience'].toString()) ?? 0,
//       hourlyRate: json['hourly_rate'] is int
//           ? json['hourly_rate']
//           : int.tryParse(json['hourly_rate'].toString()) ?? 0,
//       latitude: json['latitude'] is double
//           ? json['latitude']
//           : double.tryParse(json['latitude'].toString()) ?? 0.0,
//       longitude: json['longitude'] is double
//           ? json['longitude']
//           : double.tryParse(json['longitude'].toString()) ?? 0.0,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'full_name': fullName,
//       'image': plumberImage,
//       'experience': experience,
//       'hourly_rate': hourlyRate,
//       'latitude': latitude,
//       'longitude': longitude,
//     };
//   }
// }

//00000000000000000000000000000000000000000000000000000000000000000000 yai model shi id bhaij raha hai plumber profile say lkn picture nhi dkhaaa raha plumber ki

// class Plumber {
//   final int id;
//   final String fullName;
//   final String? plumberImage;
//   final String experience;
//   final double hourlyRate;

//   Plumber({
//     required this.id,
//     required this.fullName,
//     this.plumberImage,
//     required this.experience,
//     required this.hourlyRate,
//   });

//   factory Plumber.fromJson(Map<String, dynamic> json) {
//     return Plumber(
//       id: json['profile_id'] ?? json['id'] ?? 0,
//       fullName: json['full_name'] ?? '',
//       plumberImage: json['plumber_image'],
//       experience: json['experience']?.toString() ?? '',
//       hourlyRate: (json['hourly_rate'] != null)
//           ? double.tryParse(json['hourly_rate'].toString()) ?? 0
//           : 0,
//     );
//   }
// }


// is may emergency ka masla aaaa raha hai
// class Plumber {
//   final int id;
//   final String fullName;
//   final String? plumberImage;
//   final String experience;
//   final double hourlyRate;

//   Plumber({
//     required this.id,
//     required this.fullName,
//     this.plumberImage,
//     required this.experience,
//     required this.hourlyRate,
//   });

//   factory Plumber.fromJson(Map<String, dynamic> json) {
//     // Safely parse plumber_image as String? (nullable)
//     String? image;
//     if (json['plumber_image'] != null &&
//         json['plumber_image'] is String &&
//         (json['plumber_image'] as String).isNotEmpty) {
//       image = json['plumber_image'];
//     } else {
//       image = null;
//     }

//     return Plumber(
//       id: json['profile_id'] ?? json['id'] ?? 0,
//       fullName: json['full_name'] ?? '',
//       plumberImage: image,
//       experience: json['experience']?.toString() ?? '',
//       hourlyRate: (json['hourly_rate'] != null)
//           ? double.tryParse(json['hourly_rate'].toString()) ?? 0
//           : 0,
//     );
//   }
// }




class Plumber {
  final int id;
  final String fullName;
  final String? plumberImage;
  final String experience;
  final double hourlyRate;
  final List<String> services;
  final String? serviceArea;

  Plumber({
    required this.id,
    required this.fullName,
    this.plumberImage,
    required this.experience,
    required this.hourlyRate,
    required this.services,
    this.serviceArea,
  });

  factory Plumber.fromJson(Map<String, dynamic> json) {
    List<String> parsedServices = [];
    if (json['skill'] != null) {
      if (json['skill'] is String) {
        parsedServices =
            (json['skill'] as String).split(',').map((s) => s.trim()).toList();
      } else if (json['skill'] is List) {
        parsedServices = List<String>.from(json['skill']);
      }
    }

    return Plumber(
      id: json['profile_id'] ?? json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      plumberImage: json['image'],
      experience: json['experience']?.toString() ?? '',
      hourlyRate: (json['hourly_rate'] != null)
          ? double.tryParse(json['hourly_rate'].toString()) ?? 0
          : 0,
      services: parsedServices,
      serviceArea: json['service_area'],
    );
  }

  get skill => null;
}
