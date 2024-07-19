/*
class chatmessage {

  final List<ChatData> chatdata;

  chatmessage({
    required this.chatdata,
  });

  factory chatmessage.fromJson(Map<String, dynamic> json) {
    return chatmessage(
      chatdata: (json['data'] as List).map((i) => ChatData.fromJson(i as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatdata': chatdata.map((chatdata) => chatdata.toJson()).toList(),
    };
  }
}

class ChatData {
  final String url;


  ChatData({
    required this.url,

  });

  factory ChatData.fromJson(Map<String, dynamic> json) {
    return ChatData(
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,

    };
  }
}


class Patient {
  int id;
  String name;
  String phone;
  String email;
  String relationship;
  String address;

  Patient({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.relationship,
    required this.address,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
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
*/