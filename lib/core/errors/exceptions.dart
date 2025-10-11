import 'package:flutter/material.dart';
import 'package:ucleankim/main.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

/// Specialized Auth Exceptions
class AuthException implements Exception {
  final String message;
  final int? statusCode;

  AuthException(this.message, [this.statusCode]);

  @override
  String toString() => 'AuthException: $message';
}

/// Login specific exceptions
class InvalidCredentialsException extends AuthException {
  InvalidCredentialsException([String message = 'Invalid email or password'])
      : super(message, 401);
}

class AccountLockedException extends AuthException {
  AccountLockedException([String message = 'Account is temporarily locked'])
      : super(message, 423);
}

class EmailNotVerifiedException extends AuthException {
  EmailNotVerifiedException(
      [String message = 'Please verify your email address'])
      : super(message, 403);
}

/// Network and Server Exceptions
class TimeoutException extends NetworkException {
  @override
  String toString() =>
      'Request timeout. Please check your connection and try again.';
}

class ServerErrorException extends ServerException {
  final int statusCode;
  ServerErrorException(this.statusCode);

  @override
  String toString() {
    switch (statusCode) {
      case 500:
        return 'Server is temporarily unavailable. Please try again later.';
      case 502:
        return 'Service is currently undergoing maintenance.';
      case 503:
        return 'Service is temporarily overloaded. Please try again.';
      default:
        return 'Server error occurred. Please try again later.';
    }
  }
}

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NoInternetException Occurred']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
