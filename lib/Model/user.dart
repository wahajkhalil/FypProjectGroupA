
class User {
  final String name;
  final String phoneNumber;
  final String email;
  final DateTime? dateOfBirth;
  final String password;

  User({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.dateOfBirth,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'password': password,
    };
  }
}
