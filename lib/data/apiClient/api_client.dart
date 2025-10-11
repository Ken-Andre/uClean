import 'package:dio/dio.dart';

import 'package:ucleankim/core/app_export.dart';
import 'package:ucleankim/core/utils/progress_dialog_utils.dart';
import 'package:ucleankim/data/models/authLoginPost/post_auth_login_post_resp.dart';
import 'package:ucleankim/data/models/createTrip/post_create_trip_resp.dart';
import 'package:ucleankim/data/models/getAuthMe/get_get_auth_me_resp.dart';
import 'package:ucleankim/data/models/getGamificationPoints/get_gamification_points_resp.dart';
import 'package:ucleankim/data/models/getTripsFromX8kiLetlTwmt/get_get_trips_from_x8ki_letl_twmt_resp.dart';
import 'package:ucleankim/data/models/logoutPost/post_logout_post_resp.dart';
import 'package:ucleankim/data/models/postGamificationPoint/post_gamification_point_resp.dart';
import 'package:ucleankim/data/models/signupPost/post_signup_post_resp.dart';

import 'network_interceptor.dart';

class ApiClient {
  static var token;

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
    // "Authorization": token?"Bearer ${token}":"",
  }))
        ..interceptors.add(NetworkInterceptor());

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!(await NetworkInfo().isConnected())) {
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
  /// {
  ///     "authToken": "eyJhbGciOiJBMjU2S1ciLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiemlwIjoiREVGIn0.KOq5BLVIGMpag8OawlRdkUFnIVeVdehaEMnc5BQa81N-dyc1D4ZutUdLo20UCAZr0psSGlLSuRKaIdJYadzte8g97j-L4Q_X.CjfWuS9S6o2etMUmOIQTjA.Xbde97c4w9klawhv9osb8OFlrzbWZuH4uayZSOnPQZAXIS9CYGtWqJbm3IR1--d7I5UsWkfWHuUX0LhsCFApodyBsAhXCWgPLHJxe7ApHM0sb1K3Qz4-Y36avYElhabhfCNhuJL42uo1veKS4DqSylDUPLvjD51y8j-yPwIHU8g.yOj0PJgpq1Z7-S7YxWOS6H89GVSubFvtQv5iLP7vhzo"
  /// }
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
      // Override headers to ensure JSON content type for authentication
      final authHeaders = {
        ...headers,
        "Content-Type": "application/json",
      };
      var response = await _dio.post(
        '$url/api:v0yDfnCj/auth/login',
        data: requestData,
        options: Options(headers: authHeaders),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        if (response.data != null) {
          print("User logged \n The token: ${response.data}");
          return PostAuthLoginPostResp.fromJson(response.data);
        } else {
          throw Exception('La reponse du serveur est nulle');
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
      // Override headers to ensure JSON content type for authentication
      final authHeaders = {
        ...headers,
        "Content-Type": "application/json",
      };
      var response = await _dio.post(
        '$url/api:v0yDfnCj/auth/signup',
        data: requestData,
        options: Options(headers: authHeaders),
      );
      ProgressDialogUtils.hideProgressDialog();

      if (_isSuccessCall(response)) {
        if (response.data != null) {
          // var prefs = await SharedPreferences.getInstance();
          // token = PostSignupPostResp.fromJson(response.data).authToken!;

          // await PrefUtils().setAuthToken(token);
          print("Token from Signup Screen: ${response.data}");
          return PostSignupPostResp.fromJson(response.data);
        } else {
          throw Exception('Server didn\'t respond.');
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

  /// Performs API call for https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/logout
  ///
  /// Sends a POST request to the server's 'https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/logout' endpoint
  /// with the provided headers and request data
  /// Returns a [PostLogoutPostResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostLogoutPostResp> logoutPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/api:v0yDfnCj/auth/logout',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        PrefUtils().setAuthToken('');
        return PostLogoutPostResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostLogoutPostResp.fromJson(response.data)
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

  /// Performs API call for https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/trips
  ///
  /// Sends a POST request to the server's 'https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/trips' endpoint
  /// with the provided headers and request data
  /// Returns a [PostCreateTripResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostCreateTripResp> createTrip({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/api:v0yDfnCj/trips',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostCreateTripResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostCreateTripResp.fromJson(response.data)
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

  /// Performs API call for https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/trips
  ///
  /// Sends a GET request to the server's 'https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/trips' endpoint
  /// with the provided headers and request data
  /// Returns a [GetGetTripsFromX8kiLetlTwmtResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<List<GetGetTripsFromX8kiLetlTwmtResp>> getTripsFromX8kiLetlTwmt(
      {Map<String, String> headers = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/api:v0yDfnCj/trips',
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        print('Dio successful recover rep data');
        return (response.data as List)
            .map((e) => GetGetTripsFromX8kiLetlTwmtResp.fromJson(e))
            .toList();
      } else {
        throw response.data != null
            ? (response.data as List)
                .map((e) => GetGetTripsFromX8kiLetlTwmtResp.fromJson(e))
                .toList()
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

  /// Performs API call for https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/me
  ///
  /// Sends a GET request to the server's 'https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/me' endpoint
  /// with the provided headers and request data
  /// Returns a [GetGetAuthMeResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<GetGetAuthMeResp> getAuthMe(
      {Map<String, String> headers = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/api:v0yDfnCj/auth/me',
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return GetGetAuthMeResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? GetGetAuthMeResp.fromJson(response.data)
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

  /// Performs API call for https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/gamification_point
  ///
  /// Sends a GET request to the server's 'https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/gamification_point' endpoint
  /// to retrieve all gamification points
  /// Returns a [List<GetGamificationPointsResp>] representing the gamification points records.
  /// Throws an error if the request fails or an exception occurs.
  Future<List<GetGamificationPointsResp>> getGamificationPoints(
      {Map<String, String> headers = const {}}) async {
    // Note: Pas de ProgressDialog pour ne pas bloquer l'UI
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/api:v0yDfnCj/gamification_point',
        options: Options(headers: headers),
      );

      if (_isSuccessCall(response)) {
        print('📊 Gamification API raw response: ${response.data} (type: ${response.data.runtimeType})');

        // Handle case where API returns total count as integer
        if (response.data is int) {
          final totalPoints = response.data as int;
          print('📊 API returned total count: $totalPoints points');

          // Return a single point record representing the total
          final totalRecord = GetGamificationPointsResp(
            id: 0, // Synthetic ID for total
            createdAt: DateTime.now().millisecondsSinceEpoch / 1000,
            user: 0, // Current user ID - you might want to get this from prefs
            points: totalPoints,
            awardedAt: DateTime.now().toIso8601String().split('T')[0],
          );

          print('📊 Created synthetic total record: $totalRecord');
          return [totalRecord];
        }

        // Handle case where API returns list of points
        if (response.data is List) {
          final list = (response.data as List)
              .map((e) => GetGamificationPointsResp.fromJson(e))
              .toList();
          print('📊 Parsed ${list.length} gamification point(s)');
          return list;
        }

        // Handle unexpected response type
        print('⚠️ Gamification API response is not a List or int: ${response.data.runtimeType}');
        return [];
      } else {
        throw response.data != null
            ? response.data.toString()
            : 'Erreur API - Code ${response.statusCode}';
      }
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/gamification_point
  ///
  /// Sends a POST request to the server's 'https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/gamification_point' endpoint
  /// to add a new gamification point record
  /// Returns a [PostGamificationPointResp] representing the created record.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostGamificationPointResp> postGamificationPoint({
    Map<String, String> headers = const {},
    required int points,
    required DateTime awardedAt,
  }) async {
    // Note: Pas de ProgressDialog pour ne pas bloquer l'UI
    try {
      await isNetworkConnected();

      final requestData = {
        'points': points,
        'awarded_at': awardedAt.toIso8601String().split('T')[0], // Format YYYY-MM-DD
      };

      Logger.log('Envoi de points à l\'API: $points points le ${awardedAt.toIso8601String().split('T')[0]}');

      Response response = await _dio.post(
        '$url/api:v0yDfnCj/gamification_point',
        data: requestData,
        options: Options(headers: headers),
      );

      if (_isSuccessCall(response)) {
        print('✅ Points envoyés avec succès à l\'API - Status: ${response.statusCode}');
        print('📤 Request data: $requestData');
        print('📥 Response data: ${response.data}');
        return PostGamificationPointResp.fromJson(response.data);
      } else {
        print('❌ Erreur API lors de l\'envoi des points: ${response.statusCode}');
        print('📤 Request data: $requestData');
        print('📥 Response data: ${response.data}');
        throw response.data != null
            ? response.data.toString()
            : 'Erreur API - Code ${response.statusCode}';
      }
    } catch (error, stackTrace) {
      Logger.log(
        'Erreur lors de l\'envoi des points: $error',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
