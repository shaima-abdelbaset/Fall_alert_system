import 'package:dio/dio.dart';
import 'package:fall_detection/feature/messages/presentation/Manger/Cubits/MessagesCubit/MessagesStates.dart';
import 'package:fall_detection/feature/profile/presenation/Manger/Cubits/UserCubit/UserStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/services/network/api/api_consumer.dart';
import '../../../../../../core/services/network/api/api_endpoints.dart';
import '../../../../../../core/services/network/error/exceptions.dart';
import '../../../../data/Models/UserModel.dart';


import '../../../../data/Models/updateProfileModel.dart';

class UserCubit extends Cubit<UserState>{

  UserCubit( this.api) : super(UserInitialstate());


  final ApiConsumer api;

UserModel? user;
  TextEditingController nameController=TextEditingController();
  TextEditingController genderController=TextEditingController();
  TextEditingController phoneController=TextEditingController();

  



  Future<void> updateProfile({XFile? photo}) async {
    emit(ProfileUpdating());

    FormData formData = FormData.fromMap({
      ApiKey.name: nameController.text,
      ApiKey.gender: genderController.text,
      ApiKey.phone: phoneController.text,
    });

    if (photo != null) {
      String fileName = photo.path.split('/').last;
      formData.files.add(MapEntry(
        'photo',
        await MultipartFile.fromFile(photo.path, filename: fileName),
      ));
    }

    try {
      final response = await api.updateProfile(
          EndPoints.updateProfile,
          data: formData,
          isFormData: true,
          queryParameters: {
            '_method': 'PATCH'
          }
      );

      final profileResponse = ProfileResponse.fromJson(response);
      emit(ProfileUpdated(profileResponse.data));
    } on ServerException catch (error) {
      emit(ProfileUpdateError(error: error.errModel.message ?? "Unexpected error"));
    }
  }
}
















// Future<void> fetchChats() async {
//     emit(ChatLoading());

//     try {
//       final response = await api.get(EndPoints.chats);
//       final chatResponse = ChatResponse.fromJson(response);
//       emit(ChatLoadedSuccess(chatResponse));
//     } on ServerException catch (error) {
//       emit(ChatError(message: error.errModel.message!));
//     }
//   }




