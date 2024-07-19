class HomeScreenModel {
  final int id;
  final int userId;
  final String location;
  final double latitude;
  final double longitude;
  final String severity;
  final String createdAt;
  final String updatedAt;

  final User user;

  HomeScreenModel({
    required this.id,
    required this.userId,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.severity,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) {
    return HomeScreenModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      location: json['location'] ?? '',
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
      severity: json['severity'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      user: User.fromJson(json['user'] ?? User.fromJson({})),
    );
  }
}

class User {
  final int id;
  final String name;
  final String familyName;
  final String email;
  final String phone;
  final String dateOfBirth;
  final String address;
  final String photo;

  User({
    required this.id,
    required this.name,
    required this.familyName,
    required this.email,
    required this.phone,
    required this.dateOfBirth,
    required this.address,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      familyName: json['family_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
      address: json['address'] ?? '',
      photo: json['photo'] ?? '',
    );
  }
}
