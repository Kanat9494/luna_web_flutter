import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:luna_web_flutter/api/api_constants.dart';
import 'package:luna_web_flutter/models/car.dart';
import 'package:luna_web_flutter/models/complete_response.dart';

class Api {
  final dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: Duration(seconds: 5),
    // receiveTimeout: Duration(seconds: 30),
  ));

  Future<Response?> _baseRequest({required String url}) async {
    return null;
  }

  Future<List<Car>> loadCarsList() async {
    final response = await dio.get(ApiConstants.carsList);

    final cars =
        List<Car>.from(response.data.map((carItem) => Car.fromJson(carItem)));

    return cars;
  }
}

Future<int> singUp({
  required String firstName,
  required String secondName,
  required String email,
  required String phone,
}) async {
  final response = await Dio().post(
    '${ApiConstants.baseUrl}api/v1/auth/signup',
    options: Options(
      contentType: Headers.jsonContentType,
    ),
    data: {
      "firstName": firstName,
      "lastName": secondName,
      "phone": email,
      "email": phone,
    },
  );

  return response.data['tempUserId'];
}

Future<bool> verifyPhone({
  required int tempUserId,
  required String verificationCode,
}) async {
  final response = await Dio().post(
    '${ApiConstants.baseUrl}{{user_url}}/api/v1/auth/signup/verify-phone',
    options: Options(
      contentType: Headers.jsonContentType,
    ),
    data: {
      "tempUserId": tempUserId,
      "verificationCode": verificationCode,
    },
  );

  return response.data == true;
}

// Future<AuthResponse> complete({
//   required int tempUserId,
//   required String verificationCode,
//   required String password,
//   required String platform,
// }) async {
//   final response = await Dio().post(
//     '${ApiConstants.baseUrl}{{user_url}}/api/v1/auth/signup/complete',
//     options: Options(
//       contentType: Headers.jsonContentType,
//     ),
//     data: {
//       "tempUserId": tempUserId,
//       "verificationCode": verificationCode,
//       "password": password,
//       "platform": platform,
//     },
//   );
//
//   return AuthResponse();
// }

// Future<AuthResponse> login({
//   required String phone,
//   required String password,
//   required String platform,
// }) async {
//   final response = await Dio().post(
//     '${ApiConstants.baseUrl}{{user_url}}/api/v1/auth/signup/complete',
//     options: Options(
//       contentType: Headers.jsonContentType,
//     ),
//     data: {
//       "phone": phone,
//       "password": password,
//       "platform": platform,
//     },
//   );
//
//   return AuthResponse();
// }

// void registerDioDI({required String accessToken}) {
//   GetIt.I.registerSingleton<Api>(A);
// }