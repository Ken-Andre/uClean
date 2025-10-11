// ignore_for_file: unnecessary_overrides

import 'package:dio/dio.dart';
import 'package:ucleankim/core/utils/pref_utils.dart';

/// NetworkInterceptor class for intercepting API requests, responses, and exceptions.
///
/// This class extends the [Interceptor] class from the Dio HTTP client library
/// and overrides the [onRequest], [onError] and [onResponse] methods to intercept
/// different stages of the API request lifecycle.
///
/// use this class to add custom logic or perform actions such as logging,
/// modifying headers, or handling errors before and after making API requests.
class NetworkInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    super.onRequest(options, handler);

    // Ajouter automatiquement le token d'authentification si disponible
    final token = PrefUtils().getAuthToken();
    
    // Log des requêtes pour le debug
    print('🚀 API Request: ${options.method} ${options.uri}');
    
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      print('🔐 Auth token présent dans les headers');
      print('🔍 Token length: ${token.length} chars');
      print('🔍 Token start: ${token.substring(0, token.length > 30 ? 30 : token.length)}...');
    } else {
      print('! Aucun token d\'authentification trouvé');
    }
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    super.onError(err, handler);

    // Log des erreurs pour le debug
    print('❌ API Error: ${err.response?.statusCode} ${err.response?.statusMessage}');
    print('URL: ${err.requestOptions.uri}');
    print('Method: ${err.requestOptions.method}');

    if (err.response?.data != null) {
      print('Response data: ${err.response?.data}');
    }
    if (err.response?.headers != null) {
      print('Response headers: ${err.response?.headers}');
    }

    if (err.response?.statusCode == 401) {
      print('🔒 Erreur 401 - Token d\'authentification invalide ou manquant');
      // Note: Token is NOT automatically cleared here to avoid clearing valid tokens
      // The app should handle token refresh or re-login at the business logic level
    } else if (err.response?.statusCode == 403) {
      print('🚫 Erreur 403 - Accès interdit');
    }
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    super.onResponse(response, handler);

    // Log des réponses pour le debug
    print('✅ API Response: ${response.statusCode} ${response.statusMessage}');
  }
}
