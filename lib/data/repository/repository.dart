import 'package:uclean/data/models/listUser/post_list_user_resp.dart';
import 'package:uclean/data/models/postForgotPasswordToken/post_post_forgot_password_token_resp.dart';
import 'package:uclean/data/models/postRegister/post_post_register_resp.dart';
import 'package:uclean/data/models/postUserLogin/post_post_user_login_resp.dart';
import 'package:uclean/data/models/putPassword/put_put_password_resp.dart';
import 'package:uclean/data/models/putResetPasswordToken/put_put_reset_password_token_resp.dart';

import '../apiClient/api_client.dart';

/// Repository class for managing API requests.
///
/// This class provides a simplified interface for making the
/// API request using the [ApiClient] instance
class Repository {
  final _apiClient = ApiClient();

  Future<PutPutPasswordResp> putPassword({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.putPassword(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PutPutResetPasswordTokenResp> putResetPasswordToken({
    Map<String, String> headers = const {},
    Map requestData = const {},
    String? token = '',
  }) async {
    return await _apiClient.putResetPasswordToken(
      headers: headers,
      requestData: requestData,
      token: token,
    );
  }

  Future<PostPostForgotPasswordTokenResp> postForgotPasswordToken({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.postForgotPasswordToken(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostPostRegisterResp> postRegister({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.postRegister(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostPostUserLoginResp> postUserLogin({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.postUserLogin(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostListUserResp> listUser({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.listUser(
      headers: headers,
      requestData: requestData,
    );
  }
}
