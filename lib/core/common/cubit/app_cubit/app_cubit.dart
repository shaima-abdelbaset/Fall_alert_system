import 'package:fall_detection/core/common/cubit/app_cubit/app_state.dart';
import 'package:fall_detection/core/services/network/api/api_endpoints.dart';
import 'package:fall_detection/core/services/network/api/dio_consumer.dart';
import 'package:fall_detection/core/services/network/error/exceptions.dart';
import 'package:fall_detection/feature/home/data/models/home_screen_model.dart';
import 'package:fall_detection/feature/messages/Models/MessagesModel/MessagesModel.dart';
import 'package:fall_detection/feature/notification/data/model/NotificationModel.dart';
import 'package:fall_detection/feature/profile/presenation/Manger/Cubits/UserCubit/UserStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../feature/profile/data/Models/UserModel.dart';
import '../../../services/shared_prefrences/shared_pref.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.api) : super(AppInitialstate());
  DioConsumer api;

  getUserProfile() async {
    try {
      emit(AppLoadingState());
      const bool deep = true;
      final response = await api
          .get(EndPoints.getUserProfile, queryParameters: {'deep': deep});
      emit(AppSuccessState(user: UserModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(AppFailerState(errorMessage: e.errModel.message!));
    }
  }

  Chat? chats;

  Future<void> fetchChats() async {
    emit(AppLoadingState());

    try {
      final response = await api.get(EndPoints.chats);
      final chatResponse = ChatResponse.fromJson(response);

      emit(AppLoadedSuccess(chatResponse: chatResponse));
    } on ServerException catch (error) {
      emit(AppFailerState(errorMessage: error.errModel.message!));
    }
  }

  NotificationModel? notifications;

  Future<void> fetchNotifications() async {
    emit(AppLoadingState());
    try {
      final response = await api.get(
        EndPoints.getAllNotifications,
        // token: token,
      );
      final notificationsResponse = NotificationModel.fromJson(response);
      emit(AppLoadedSuccess2(notificationsResponse));
    } on ServerException catch (error) {
      emit(AppFailerState(errorMessage: error.errModel.message!));
    }
  }

  // HomeScreenModel? homeScreenModel;

  // Future<void> getHomeScreenData({required String token}) async {
  //   emit(AppLoadingState());
  //   try {
  //     print("Sending request to ${EndPoints.homeScreen} with token $token");
  //     final response = await api.get(
  //       EndPoints.homeScreen,
  //       token: token,
  //     );

  //     // Print the entire response to understand its structure
  //     print("Response received: $response");

  //     if (response is Map<String, dynamic>) {
  //       // Check if the 'data' key exists
  //       if (response.containsKey('data')) {
  //         final data = response['data'];
  //         if (data is List) {
  //           List<HomeScreenModel> alerts =
  //               data.map((item) => HomeScreenModel.fromJson(item)).toList();
  //           emit(AppSuccessState(alerts));
  //         } else {
  //           emit(const HomeErrorState(
  //               'Unexpected data format: Expected a list'));
  //         }
  //       } else {
  //         emit(const HomeErrorState(
  //             'Unexpected response format: Missing "data" key'));
  //       }
  //     } else {
  //       emit(
  //           const HomeErrorState('Unexpected response format: Expected a map'));
  //     }
  //   } on DioException catch (dioError) {
  //     print("DioError occurred: ${dioError.message}");
  //     String errorMessage = 'An error occurred';
  //     if (dioError.response != null) {
  //       final statusCode = dioError.response!.statusCode;
  //       final responseData = dioError.response!.data;
  //       print("DioError response data: $responseData");
  //       if (statusCode == 401 &&
  //           responseData is Map<String, dynamic> &&
  //           responseData.containsKey('message') &&
  //           responseData['message'] == 'Unauthenticated.') {
  //         errorMessage = 'You are not authenticated. Please log in again.';
  //       } else if (statusCode == 401) {
  //         errorMessage = 'Unauthorized. Please check your credentials.';
  //       } else if (statusCode == 500) {
  //         errorMessage = 'Server error. Please try again later.';
  //       } else {
  //         errorMessage = 'Received invalid status code: $statusCode';
  //       }
  //     } else {
  //       // errorMessage = dioError.message;
  //     }
  //     emit(HomeErrorState(errorMessage));
  //   } catch (error) {
  //     print("Unexpected error occurred: $error");
  //     emit(HomeErrorState(error.toString()));
  //   }
  // }
}
