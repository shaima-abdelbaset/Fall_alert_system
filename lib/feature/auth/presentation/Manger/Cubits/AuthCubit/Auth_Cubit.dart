//import 'package:device_info_plus/device_info_plus.dart';
import 'package:fall_detection/feature/auth/presentation/Manger/Cubits/AuthCubit/Auth_States.dart';
//import 'package:fall_detection/feature/auth/presentation/Manger/Cubits/Auth_Cubit/Auth_States.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../../core/api/api_consumer.dart';
// import '../../../../../../core/api/end_ponits.dart';
// import '../../../../../../core/cache/cache_helper.dart';
// import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/services/network/api/api_consumer.dart';
import '../../../../../../core/services/network/api/api_endpoints.dart';
import '../../../../../../core/services/network/error/exceptions.dart';
import '../../../../../../core/services/shared_prefrences/shared_pref.dart';
import '../../../../data/models/signUp_model.dart';
import '../../../../data/models/signin_model.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.api) : super(UserInitial());

  final ApiConsumer api;

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  TextEditingController signUpGender = TextEditingController();

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(
        EndPoints.signUp,
        isFormData: true,
        data: {
          ApiKey.name: signUpName.text,
          ApiKey.phone: signUpPhoneNumber.text,
          ApiKey.email: signUpEmail.text,
          ApiKey.password: signUpPassword.text,
          ApiKey.gender: signUpGender.text,
          ApiKey.date_of_birth: "2024-03-07 18:36:20",
          ApiKey.country: "Egypt",
          ApiKey.rating: 0,
          // ApiKey.confirmPassword:"Shimaa@@1234",
          // ApiKey.photo:"https://th.bing.com/th/id/OIP.qjJymN6ir_3Kyq9UIJZXOAHaKC?rs=1&pid=ImgDetMain",
          ApiKey.address: "Egypt Assuit",
        },
      );
      final signUPModel = SignUp_Model.fromJson(response);
      emit(SignUpSuccess(id: signUPModel.id));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.message!));
    }
  }

  SignInModel? user;
  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        EndPoints.login,
        data: {
          ApiKey.email: signInEmail.text,
          ApiKey.password: signInPassword.text,
          ApiKey.device_name: "Nokia 5.1"
        },
      );
      user = SignInModel.fromJson(response);

      CacheHelper().saveData(key: ApiKey.token, value: user!.token);

      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.message??"the Provided credential are incorrect"));
    }
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      final token = CacheHelper().getData(key: ApiKey.token);
      if (token != null) {
        await api.logout(EndPoints.logout);

        // Clear the token from cache
        await CacheHelper().removeData(key: ApiKey.token);
        //user = SignInModel.fromJson(response);
        emit(AuthLoggedOut());
      } else {
        emit(LogoutError(message: 'No token found'));
      }
    } on ServerException catch (e) {
      emit(LogoutError(message: 'Logout failed: ${e.errModel.message}'));
    }
  }
}
  // Future<String> getDeviceName()async{
  //   Map deviceInfo = (await DeviceInfoPlugin().deviceInfo).data;
  //
  //   String? model = deviceInfo['model'];
  //   String? name = deviceInfo['name'];
  //
  //   return name ?? '$name $model';
  // }
