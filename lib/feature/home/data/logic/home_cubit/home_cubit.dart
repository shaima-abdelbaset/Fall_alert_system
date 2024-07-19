import 'package:fall_detection/core/services/network/api/dio_consumer.dart';
import 'package:fall_detection/feature/home/data/logic/home_cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/network/api/api_endpoints.dart';
import 'package:fall_detection/feature/home/data/models/home_screen_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/services/shared_prefrences/shared_pref.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.dio) : super(HomeInitialState());
  final DioConsumer dio;
  HomeScreenModel? homeScreenModel;

  Future<void> getHomeScreenData({required String token}) async {
    emit(HomeLoadingState());
    try {
      print("Sending request to ${EndPoints.homeScreen} with token $token");
      final response = await dio.get(
        EndPoints.homeScreen,
        token: token,
      );

      // Print the entire response to understand its structure
      print("Response received: $response");

      if (response is Map<String, dynamic>) {
        // Check if the 'data' key exists
        if (response.containsKey('data')) {
          final data = response['data'];
          if (data is List) {
            List<HomeScreenModel> alerts =
                data.map((item) => HomeScreenModel.fromJson(item)).toList();
            CacheHelper()
                .saveData(key: ApiKey.homeid, value: homeScreenModel?.id);
            CacheHelper().saveData(
                key: ApiKey.homeUserId, value: homeScreenModel?.userId);
            emit(HomeLoaded(alerts));
          } else {
            emit(const HomeErrorState(
                'Unexpected data format: Expected a list'));
          }
        } else {
          emit(const HomeErrorState(
              'Unexpected response format: Missing "data" key'));
        }
      } else {
        emit(
            const HomeErrorState('Unexpected response format: Expected a map'));
      }
    } on DioException catch (dioError) {
      print("DioError occurred: ${dioError.message}");
      String errorMessage = 'An error occurred';
      if (dioError.response != null) {
        final statusCode = dioError.response!.statusCode;
        final responseData = dioError.response!.data;
        print("DioError response data: $responseData");
        if (statusCode == 401 &&
            responseData is Map<String, dynamic> &&
            responseData.containsKey('message') &&
            responseData['message'] == 'Unauthenticated.') {
          errorMessage = 'You are not authenticated. Please log in again.';
        } else if (statusCode == 401) {
          errorMessage = 'Unauthorized. Please check your credentials.';
        } else if (statusCode == 500) {
          errorMessage = 'Server error. Please try again later.';
        } else {
          errorMessage = 'Received invalid status code: $statusCode';
        }
      } else {
        // errorMessage = dioError.message;
      }
      emit(HomeErrorState(errorMessage));
    } catch (error) {
      print("Unexpected error occurred: $error");
      emit(HomeErrorState(error.toString()));
    }
  }
}
