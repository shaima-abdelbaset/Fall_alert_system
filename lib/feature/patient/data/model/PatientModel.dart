class Contact {
  int id;
  String name;
  String phone;
  String email;
  String relationship;
  String address;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.relationship,
    required this.address,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      relationship: json['relationship'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'relationship': relationship,
      'address': address,
    };
  }
}

class Fall {
  int id;
  int userId;
  String location;
  double latitude;
  double longitude;
  String severity;
  DateTime? createdAt;
  DateTime? updatedAt;

  Fall({
    required this.id,
    required this.userId,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.severity,
    this.createdAt,
    this.updatedAt,
  });

  factory Fall.fromJson(Map<String, dynamic> json) {
    return Fall(
      id: json['id'],
      userId: json['user_id'],
      location: json['location'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      severity: json['severity'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'severity': severity,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

class User {
  int id;
  String name;
  String familyName;
  String? photo;
  String phone;
  String country;
  String address;
  String dateOfBirth;
  String email;
  DateTime? emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  List<Contact> contacts;
  List<Fall> falls;

  User({
    required this.id,
    required this.name,
    required this.familyName,
    this.photo,
    required this.phone,
    required this.country,
    required this.address,
    required this.dateOfBirth,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.contacts,
    required this.falls,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var contactList = json['contacts'] as List<dynamic>? ?? [];
    List<Contact> contacts = contactList.map((i) => Contact.fromJson(i)).toList();

    var fallList = json['falls'] as List<dynamic>? ?? [];
    List<Fall> falls = fallList.map((i) => Fall.fromJson(i)).toList();

    return User(
      id: json['id'],
      name: json['name'],
      familyName: json['family_name'],
      photo: json['photo'],
      phone: json['phone'],
      country: json['country'],
      address: json['address'],
      dateOfBirth: json['date_of_birth'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'] != null ? DateTime.parse(json['email_verified_at']) : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      contacts: contacts,
      falls: falls,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'family_name': familyName,
      'photo': photo,
      'phone': phone,
      'country': country,
      'address': address,
      'date_of_birth': dateOfBirth,
      'email': email,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'contacts': contacts.map((contact) => contact.toJson()).toList(),
      'falls': falls.map((fall) => fall.toJson()).toList(),
    };
  }
}
