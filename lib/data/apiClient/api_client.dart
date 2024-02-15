import 'package:dio/dio.dart';
import 'package:uclean/core/app_export.dart';
import 'package:uclean/core/utils/progress_dialog_utils.dart';
import 'package:uclean/data/models/listUser/post_list_user_resp.dart';
import 'package:uclean/data/models/postForgotPasswordToken/post_post_forgot_password_token_resp.dart';
import 'package:uclean/data/models/postRegister/post_post_register_resp.dart';
import 'package:uclean/data/models/postUserLogin/post_post_user_login_resp.dart';
import 'package:uclean/data/models/putPassword/put_put_password_resp.dart';
import 'package:uclean/data/models/putResetPasswordToken/put_put_reset_password_token_resp.dart';

import 'network_interceptor.dart';

class ApiClient {
  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  var url = Get.find<EnvConfig>().config.baseUrl;

  var dhiwiseUrl = "https://nodedemo.dhiwise.co";

  static final ApiClient _apiClient = ApiClient._internal();

  final _dio =
      Dio(BaseOptions(connectTimeout: const Duration(seconds: 60), headers: {
    "Accept": "application/json",
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYTNmOTI0NTNjODViYzEyNjU4ZjNiZSIsInVzZXJuYW1lIjoiSnVkZ2VfQ3JvbmluIiwiaWF0IjoxNjcxNjk3MTcxfQ.hbZLKSsS6Mdj1ndhAf4rm_5we4iWYvKY1VPSo51sQRM",
    "Content-Type": "application/json"
  }))
        ..interceptors.add(NetworkInterceptor());

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await NetworkInfo().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    if (response.statusCode != null) {
      return response.statusCode! >= 200 && response.statusCode! <= 299;
    }
    return false;
  }

  /// Performs API call for {{baseUrl}}/user/password
  ///
  /// Sends a PUT request to the server's '{{baseUrl}}/user/password' endpoint
  /// with the provided headers and request data
  /// Returns a [PutPutPasswordResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PutPutPasswordResp> putPassword({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.put(
        '$url/user/password',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PutPutPasswordResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PutPutPasswordResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for {{baseUrl}}/user/reset-password/{token}
  ///
  /// Sends a PUT request to the server's '{{baseUrl}}/user/reset-password/{token}' endpoint
  /// with the provided headers and request data
  /// Returns a [PutPutResetPasswordTokenResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PutPutResetPasswordTokenResp> putResetPasswordToken({
    Map<String, String> headers = const {},
    Map requestData = const {},
    String? token = '',
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.put(
        '$url/user/reset-password/{token}',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PutPutResetPasswordTokenResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PutPutResetPasswordTokenResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for {{baseUrl}}/user/forgot-password-token
  ///
  /// Sends a POST request to the server's '{{baseUrl}}/user/forgot-password-token' endpoint
  /// with the provided headers and request data
  /// Returns a [PostPostForgotPasswordTokenResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostPostForgotPasswordTokenResp> postForgotPasswordToken({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/user/forgot-password-token',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostPostForgotPasswordTokenResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostPostForgotPasswordTokenResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for {{baseUrl}}/user/register
  ///
  /// Sends a POST request to the server's '{{baseUrl}}/user/register' endpoint
  /// with the provided headers and request data
  /// Returns a [PostPostRegisterResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostPostRegisterResp> postRegister({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/user/register',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostPostRegisterResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostPostRegisterResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for {{baseUrl}}/user/login
  ///
  /// Sends a POST request to the server's '{{baseUrl}}/user/login' endpoint
  /// with the provided headers and request data
  /// Returns a [PostPostUserLoginResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostPostUserLoginResp> postUserLogin({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/user/login',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostPostUserLoginResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostPostUserLoginResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://nodedemo.dhiwise.co/device/api/v1/user/list
  ///
  /// Sends a POST request to the server's 'https://nodedemo.dhiwise.co/device/api/v1/user/list' endpoint
  /// with the provided headers and request data
  /// Returns a [PostListUserResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostListUserResp> listUser({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$dhiwiseUrl/device/api/v1/user/list',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostListUserResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostListUserResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
