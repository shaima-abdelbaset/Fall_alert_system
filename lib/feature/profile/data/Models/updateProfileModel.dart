class ProfileResponse {
  final ProfileData data;

  ProfileResponse({required this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      data: ProfileData.fromJson(json['data']),
    );
  }
}

class ProfileData {
  final int id;
  final String name;
  final String email;
  final String dateOfBirth;
  final String phone;
  final String? country;
  final String address;
  final String photo;
  final String gender;
  final int rating;

  ProfileData({
    required this.id,
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.phone,
    this.country,
    required this.address,
    required this.photo,
    required this.gender,
    required this.rating,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      dateOfBirth: json['date_of_birth'],
      phone: json['phone'],
      country: json['country'],
      address: json['address'],
      photo: json['photo'],
      gender: json['gender'],
      rating: json['rating'],
    );
  }
}
