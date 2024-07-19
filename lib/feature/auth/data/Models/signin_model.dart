import '../../../../core/services/network/api/api_endpoints.dart';

class SignInModel {
  // final String message;
  final String token;

  SignInModel({required this.token});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      //message: jsonData[ApiKey.message],
      token: jsonData[ApiKey.token] ?? '',
    );
  }
}
