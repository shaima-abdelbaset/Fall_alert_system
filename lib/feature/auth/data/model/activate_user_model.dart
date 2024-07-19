class ActivateUserModel {
  final String statusMessage;
  final int statusCode;
  final String message;

  ActivateUserModel({
    required this.statusMessage,
    required this.statusCode,
    required this.message,
  });

  factory ActivateUserModel.fromJson(Map<String, dynamic> json) {
    return ActivateUserModel(
      statusMessage: json['status_message'] ?? '',
      statusCode: json['status_code'] ?? 0,
      message: json['message'] ?? '',
    );
  }
}
