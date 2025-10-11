import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ucleankim/core/errors/exceptions.dart';

/// Central error handler for mapping Dio errors to user-friendly exceptions
class ErrorHandler {
  /// Maps DioError to appropriate custom exceptions
  static Exception handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException();

      case DioExceptionType.connectionError:
        return NoInternetException(
            'No internet connection. Please check your network.');

      case DioExceptionType.cancel:
        return Exception('Request was cancelled');

      case DioExceptionType.badResponse:
        return _handleResponseError(error.response);

      default:
        return Exception('An unexpected error occurred');
    }
  }

  /// Handles HTTP response errors based on status code
  static Exception _handleResponseError(Response? response) {
    if (response == null) {
      return Exception('Server did not respond');
    }

    var statusCode = response.statusCode ?? 0;
    var data = response.data;

    // Auth/Login related errors
    if (response.requestOptions.path.contains('/auth/login')) {
      return _handleAuthErrors(statusCode, data);
    }

    // Server errors
    if (statusCode >= 500) {
      return ServerErrorException(statusCode);
    }

    // General client errors
    return Exception('Request failed with status code: $statusCode');
  }

  /// Specialized handling for authentication errors
  static Exception _handleAuthErrors(int statusCode, dynamic data) {
    switch (statusCode) {
      case 401:
        // Try to extract meaningful message from response
        final String message = _extractAuthErrorMessage(data);
        return InvalidCredentialsException(message);

      case 403:
        // Email not verified or other auth restrictions
        return EmailNotVerifiedException();

      case 423:
        // Account locked
        return AccountLockedException();

      default:
        return AuthException('Authentication failed', statusCode);
    }
  }

  /// Extracts user-friendly error message from auth API response
  static String _extractAuthErrorMessage(dynamic data) {
    if (data is Map && data.containsKey('message')) {
      return data['message'].toString();
    }

    if (data is Map && data.containsKey('error')) {
      return data['error'].toString();
    }

    // Default fallback message
    return 'Invalid email or password';
  }

  /// Utility method to get user-friendly error message from any exception
  static String getErrorMessage(Exception exception) {
    if (exception is NoInternetException) {
      return 'No internet connection. Please check your network and try again.';
    }

    if (exception is TimeoutException) {
      return exception.toString();
    }

    if (exception is ServerErrorException) {
      return exception.toString();
    }

    if (exception is InvalidCredentialsException) {
      return exception.message;
    }

    if (exception is AccountLockedException) {
      return exception.message;
    }

    if (exception is EmailNotVerifiedException) {
      return exception.message;
    }

    if (exception is AuthException) {
      return exception.message;
    }

    // Default fallback
    return 'Something went wrong. Please try again.';
  }
}
