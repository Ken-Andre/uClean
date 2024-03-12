import 'package:ucleankim/data/models/authLoginPost/post_auth_login_post_resp.dart';
import 'package:ucleankim/data/models/createTrip/post_create_trip_resp.dart';
import 'package:ucleankim/data/models/getTripsFromX8kiLetlTwmt/get_get_trips_from_x8ki_letl_twmt_resp.dart';
import 'package:ucleankim/data/models/logoutPost/post_logout_post_resp.dart';
import 'package:ucleankim/data/models/signupPost/post_signup_post_resp.dart';

import '../apiClient/api_client.dart';

/// Repository class for managing API requests.
///
/// This class provides a simplified interface for making the
/// API request using the [ApiClient] instance
class Repository {
  final _apiClient = ApiClient();

  Future<PostAuthLoginPostResp> authLoginPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.authLoginPost(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostSignupPostResp> signupPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.signupPost(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostLogoutPostResp> logoutPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.logoutPost(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostCreateTripResp> createTrip({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.createTrip(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<List<GetGetTripsFromX8kiLetlTwmtResp>> getTripsFromX8kiLetlTwmt(
      {Map<String, String> headers = const {}}) async {
    return await _apiClient.getTripsFromX8kiLetlTwmt(
      headers: headers,
    );
  }
}
