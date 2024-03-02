import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ucleankim/core/app_export.dart';
import 'package:ucleankim/core/utils/progress_dialog_utils.dart';
import 'package:ucleankim/data/models/authLoginPost/post_auth_login_post_resp.dart';
import 'package:ucleankim/data/models/signupPost/post_signup_post_resp.dart';

import 'network_interceptor.dart';

class ApiClient {
  static var token ;

  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  var url = "https://x8ki-letl-twmt.n7.xano.io";

  static final ApiClient _apiClient = ApiClient._internal();

  final _dio =
      Dio(BaseOptions(connectTimeout: const Duration(seconds: 60), headers: {
    "Accept": "application/json",
    // "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYTNmOTI0NTNjODViYzEyNjU4ZjNiZSIsInVzZXJuYW1lIjoiSnVkZ2VfQ3JvbmluIiwiaWF0IjoxNjcxNjk3MTcxfQ.hbZLKSsS6Mdj1ndhAf4rm_5we4iWYvKY1VPSo51sQRM",
    "Authorization": token?"Bearer ${token}":"",
        "Content-Type": "multipart/form-data"
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

  /// Performs API call for https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/login
  ///
  /// Sends a POST request to the server's 'https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/login' endpoint
  /// with the provided headers and request data
  /// Returns a [PostAuthLoginPostResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostAuthLoginPostResp> authLoginPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/api:v0yDfnCj/auth/login',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        if (response.data != null) {
          return PostAuthLoginPostResp.fromJson(response.data);
        } else {
          throw Exception('La reponse du serveur est null');
        }
      } else {
        throw response.data != null
            ? PostAuthLoginPostResp.fromJson(response.data)
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

  /// Performs API call for https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/signup
  ///
  /// Sends a POST request to the server's 'https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/signup' endpoint
  /// with the provided headers and request data
  /// Returns a [PostSignupPostResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostSignupPostResp> signupPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/api:v0yDfnCj/auth/signup',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();

      if (_isSuccessCall(response)) {
        if (response.data != null) {
          var prefs = await SharedPreferences.getInstance();
          token = PostSignupPostResp.fromJson(response.data).authToken!;
          await prefs.setString('auth_token', token!);
          print(token);
          return PostSignupPostResp.fromJson(response.data);
        } else {
          throw Exception('La reponse du serveur est null');
        }
      } else {
        throw response.data != null
            ? PostSignupPostResp.fromJson(response.data)
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
