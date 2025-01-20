// lib/repositories/dio_repository.dart
import 'package:dio/dio.dart';
import 'package:foodcart/network/APIEndpoints.dart';
import 'package:foodcart/network/ApiResponse.dart';

class DioRepository {
  final Dio _dio;

  DioRepository(this._dio);

 /* Future<ApiResponse> postLogin(String email, String password) async {
    try {
      final response = await _dio.post(
        '${APIEndpoints.baseUrl}${APIEndpoints.login}',
        data: {
          'email': email,
          'password': password,
        },
      );
      print('API Response: ${response.data}');
      return ApiResponse(success: true, data: response.data);
    } catch (e) {
      print('API Error: $e');
      return ApiResponse(success: false, error: e.toString());
    }
  }*/

  Future<Response> postLogin(String username, String password) async {
    try {
      final response = await _dio.post(
        '${APIEndpoints.baseUrl}${APIEndpoints.login}',
        data: {
          'username': username, // Use 'username' as per the API requirements
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      print('Response data: ${response.data}');
      print('Response status code: ${response.statusCode}');

      return response;
    } catch (e) {
      print('Login error: $e');
      throw Exception('Failed to login: $e');
    }
  }


}
