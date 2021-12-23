import 'package:dio/dio.dart';

import 'package:noorikapi/auth/data/login_model.dart';
import 'package:noorikapi/auth/data/registration_model.dart';
import 'package:noorikapi/auth/data/registration_reponse_model.dart';
import 'package:noorikapi/auth/data/verify_model.dart';
import 'package:noorikapi/auth/data/verify_phone_number_model.dart';
import 'package:noorikapi/core/exceptions.dart';
import 'package:noorikapi/network/network_info.dart';

const verificationLink = 'https://api.dev.metrck.com/v1/verification';
const registrationLink = 'https://api.dev.metrck.com/v1/registration';
const loginLink = 'https://api.dev.metrck.com/v1/login';

class AuthRepo {
  final Dio dio;
  final NetworkInfo networkInfo;
  AuthRepo({
    required this.dio,
    required this.networkInfo,
  });

  ///Makes a POST request to 'https://api.dev.metrck.com/v1/verification'
  ///
  ///Returns token on success
  ///
  ///Throws [NoInternetException] when internet not connected
  ///
  ///Throws [ServerException] on any server errors
  Future<String> verify({
    required final VerifyModel model,
  }) async {
    final hasConnection = await networkInfo.hasConnection();
    if (hasConnection) {
      try {
        final res = await dio.post(verificationLink);
        return res.data as String;
      } on DioError {
        throw ServerException();
      }
    } else {
      throw NoInternetException();
    }
  }

  ///Makes a PUT request to 'https://api.dev.metrck.com/v1/verification/{token}/{code}'
  ///
  ///Returns 200 OK on success
  ///
  ///Throws [NoInternetException] when internet not connected
  ///
  ///Throws [ServerException] on any server errors
  Future<bool> verifyPhoneNumber({
    required final VerifyPhoneNumberModel model,
  }) async {
    final hasConnection = await networkInfo.hasConnection();
    if (hasConnection) {
      try {
        final res = await dio.put(
          'https://api.dev.metrck.com/v1/verification/${model.token}/${model.code}',
        );
        return res.statusCode == 200;
      } on DioError {
        throw ServerException();
      }
    } else {
      throw NoInternetException();
    }
  }

  ///Makes a POST request to 'https://api.dev.metrck.com/v1/registration'
  ///
  ///Returns [RegistrationResponseModel] on success
  ///
  ///Throws [NoInternetException] when internet not connected
  ///
  ///Throws [ServerException] on any server errors
  Future<RegistrationResponseModel> register({
    required final RegistrationModel model,
  }) async {
    final hasConnection = await networkInfo.hasConnection();
    if (hasConnection) {
      try {
        final res = await dio.post(
          registrationLink,
          data: model.toMap(),
        );
        return RegistrationResponseModel.fromMap(res.data);
      } on DioError {
        throw ServerException();
      }
    } else {
      throw NoInternetException();
    }
  }

  ///Makes a POST request to 'https://api.dev.metrck.com/v1/login'
  ///
  ///Returns [RegistrationResponseModel] on success
  ///
  ///Throws [NoInternetException] when internet not connected
  ///
  ///Throws [ServerException] on any server errors
  Future<RegistrationResponseModel> login({
    required final LoginModel loginModel,
  }) async {
    final hasConnection = await networkInfo.hasConnection();
    if (hasConnection) {
      try {
        final res = await dio.post(
          loginLink,
          data: loginModel.toMap(),
        );
        return RegistrationResponseModel.fromMap(res.data);
      } on DioError {
        throw ServerException();
      }
    } else {
      throw NoInternetException();
    }
  }
}
