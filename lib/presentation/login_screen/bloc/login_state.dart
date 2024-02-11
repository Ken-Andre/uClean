// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

/// Represents the state of Login in the application.
class LoginState extends Equatable {
  LoginState({
    this.emailController,
    this.loginModelObj,
  });

  TextEditingController? emailController;

  LoginModel? loginModelObj;

  @override
  List<Object?> get props => [
        emailController,
        loginModelObj,
      ];
  LoginState copyWith({
    TextEditingController? emailController,
    LoginModel? loginModelObj,
  }) {
    return LoginState(
      emailController: emailController ?? this.emailController,
      loginModelObj: loginModelObj ?? this.loginModelObj,
    );
  }
}
