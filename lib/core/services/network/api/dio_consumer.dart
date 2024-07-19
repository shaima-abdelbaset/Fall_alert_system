import 'package:dio/dio.dart';
import 'package:fall_detection/core/services/network/api/api_consumer.dart';
import 'package:fall_detection/core/services/shared_prefrences/shared_pref.dart';

import '../error/exceptions.dart';
import 'api_endpoints.dart';
import 'api_interceptors.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }
  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters, String? token,}) async {


    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Accept': 'application/json',
            //'Content-Type': 'application/json',
            'Authorization': 'Bearer ${CacheHelper().getData(key: ApiKey.token)}',
          },
        ),



      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    String? token,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            //'Authorization': 'Bearer ${CacheHelper().getData(key: ApiKey.token)}',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }


  @override
  Future updateProfile(
      String path, {
        dynamic data,
        String? token,
        Map<String, dynamic>? queryParameters,
        bool isFormData = false,
      }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? data as FormData : data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': isFormData ? 'multipart/form-data' : 'application/json',
            'Authorization': 'Bearer ${CacheHelper().getData(key: ApiKey.token)}',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }





















  @override
  Future logout(
    String path, {
    dynamic data,
    String? token,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${CacheHelper().getData(key: ApiKey.token)}',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future put(
    String path, {
    String? token,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
    throw UnimplementedError();
  }
}
