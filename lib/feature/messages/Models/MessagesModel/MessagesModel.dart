class ChatResponse {
  final String status;
  final List<Chat> chats;

  ChatResponse({
    required this.status,
    required this.chats,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      status: json['status'] ?? '',
      chats: (json['chats'] as List).map((i) => Chat.fromJson(i as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'chats': chats.map((chat) => chat.toJson()).toList(),
    };
  }
}

class Chat {
  final String url;
  final User sender;
  final Receiver receiver;
  final String message;
  final String createdAt;

  Chat({
    required this.url,
    required this.sender,
    required this.receiver,
    required this.message,
    required this.createdAt,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      url: json['url'] ?? '',
      sender: User.fromJson(json['between']['sender'] ?? {}),
      receiver: Receiver.fromJson(json['between']['receiver'] ?? {}),
      message: json['message'] ?? '',
      createdAt: json['created_at'] ?? DateTime.now().toIso8601String(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'sender': sender.toJson(),
      'receiver': receiver.toJson(),
      'message': message,
      'created_at': createdAt,
    };
  }
}

class User {
  final int id;
  final String name;
  final String? email;
  final String? dateOfBirth;
  final String? phone;
  final String? country;
  final String? address;
  final String? photo;
  final String? gender;
  final String? rating;

  User({
    required this.id,
    required this.name,
    this.email,
    this.dateOfBirth,
    this.phone,
    this.country,
    this.address,
    this.photo,
    this.gender,
    this.rating,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'date_of_birth': dateOfBirth,
      'phone': phone,
      'country': country,
      'address': address,
      'photo': photo,
      'gender': gender,
      'rating': rating,
    };
  }
}

class Receiver {
  final int id;
  final String name;
  final String? familyName;
  final String? email;
  final String? phone;
  final String? dateOfBirth;
  final String? address;
  final String? photo;

  Receiver({
    required this.id,
    required this.name,
    this.familyName,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.address,
    this.photo,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) {
    return Receiver(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      familyName: json['family_name'],
      email: json['email'],
      phone: json['phone'],
      dateOfBirth: json['date_of_birth'],
      address: json['address'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'family_name': familyName,
      'email': email,
      'phone': phone,
      'date_of_birth': dateOfBirth,
      'address': address,
      'photo': photo,
    };
  }
}
