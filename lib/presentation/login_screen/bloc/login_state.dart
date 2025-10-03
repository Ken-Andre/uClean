// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

/// Represents the state of Login in the application.
class LoginState extends Equatable {
  LoginState({
    this.emailController,
    this.passwordController,
    this.isShowPassword = true,
    this.loginModelObj,
    this.errorMessage,
    this.isLoggedIn = false,
    this.isLoading = false,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  LoginModel? loginModelObj;

  bool isShowPassword;

  /// Error message to display to user
  String? errorMessage;

  /// Whether user is successfully logged in
  bool isLoggedIn;

  /// Whether login request is in progress
  bool isLoading;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        isShowPassword,
        loginModelObj,
        errorMessage,
        isLoggedIn,
        isLoading,
      ];

  LoginState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    LoginModel? loginModelObj,
    String? errorMessage,
    bool? isLoggedIn,
    bool? isLoading,
  }) {
    return LoginState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      loginModelObj: loginModelObj ?? this.loginModelObj,
      errorMessage: errorMessage,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
