class EndPoints {
  static String baseUrl = "https://fallyguardapi.me/api/v1/";
  static String login = "caregivers/login";
  static String signUp = "caregivers/register";
  static String forgetPassword = "caregivers/forgot-password";
  static String resetFrogetPassword = "user/reset-forgot-password";
  static String resendOtpForSignUp = 'user/resend-otp';
  static String activateUser = 'user/activate-user';
  static String resetForgetPAsswordForOtp = 'user/reset-forgot-password';
  static String getUserProfile = 'caregivers/me';
  static String getGender = 'gender';
  static String getCountry = 'location/countries';
  static String getStates = 'location/states';
  static String getPatientProfile = 'patients/11';
  static String homeScreen = "falls?deep=true";
  static String verifyUserAccount = 'caregivers/verify-email';
  static String resendCode = "caregivers/resend-code";
  static String resetPassword = "caregivers/reset-password";
  static String logout = 'auth/logout';
  static String chats = 'me/chats';
  static String updateProfile = 'caregivers/me';
  static String getAllNotifications = 'notifications';
  static String getMessagesofOtheruser='chat';

  //static String forgetPassword="caregivers/forgot-password";

  //caregivers/resend-code
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String Authorization = "Authorization";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String gender = "gender";
  static String phone = "phone";
  static String photo = "photo";
  static String password_confirmation = "password_confirmation";
  static String address = "address";
  static String country = "country";
  static String date_of_birth = "date_of_birth";
  static String rating = "rating";
  static String otp = "otp";
  static String type = "type";
  static String homeid = "id";
  static String homeUserId = "user_id";
  static String senderId='id';
  static String reciverId='id';

  static String device_name = "device_name";
}
