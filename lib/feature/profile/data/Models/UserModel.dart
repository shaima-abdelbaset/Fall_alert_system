// class UserModel {

//   final String phone;
//   final String photo;
//   final String gender;
//   final String name;
//   List<dynamic> patients;

//   UserModel({

//     required this.name,
//     required this.gender,
//     required this.phone,
//     required this.photo,
//     required this.patients

//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       name: json['name']??'',

//       gender: json['gender']??'',
//       phone: json['phone']??'',
//       photo: json['photo']??'',
//       patients: List<dynamic>.from(json['patients'])  ,

//     );
//   }
// }

class UserModel {
  final String phone;
  final String photo;
  final String gender;
  final String name;
  List<dynamic> patients;

  UserModel({
    required this.name,
    required this.gender,
    required this.phone,
    required this.photo,
    required this.patients,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      gender: json['gender'] ?? '',
      phone: json['phone'] ?? '',
      photo: json['photo'] ?? '',
      patients:
          json['patients'] != null ? List<dynamic>.from(json['patients']) : [],
    );
  }
}
