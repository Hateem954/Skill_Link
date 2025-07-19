// class Electrician {
//   final String fullName;
//   final int experience;
//   final double hourlyRate;
//   final String electricianImage;

//   Electrician({
//     required this.fullName,
//     required this.experience,
//     required this.hourlyRate,
//     required this.electricianImage,
//   });

//   factory Electrician.fromJson(Map<String, dynamic> json) {
//     return Electrician(
//       fullName: json['full_name'] ?? '',
//       experience: int.tryParse(json['experience'].toString()) ?? 0,
//       hourlyRate: double.tryParse(json['hourly_rate'].toString()) ?? 0.0,
//       electricianImage: json['electrician_image'] ?? '',
//     );
//   }
// }

class Electrician {
  final int id;
  final String email;
  final String fullName;
  final int experience;
  final double hourlyRate;
  final String electricianImage; // this will now be the full URL

  Electrician({
    required this.id,
    required this.email,
    required this.fullName,
    required this.experience,
    required this.hourlyRate,
    required this.electricianImage,
  });

  factory Electrician.fromJson(Map<String, dynamic> json) {
    return Electrician(
      id: json['profile_id'] ?? 0, // Use profile_id as per backend
      email: json['email'] ??
          '', // Ensure this field is included in backend JSON if needed
      fullName: json['full_name'] ?? '',
      experience: int.tryParse(json['experience'].toString()) ?? 0,
      hourlyRate: double.tryParse(json['hourly_rate'].toString()) ?? 0.0,
      electricianImage: json['image'] ?? '', // ✅ Corrected here
    );
  }
}
