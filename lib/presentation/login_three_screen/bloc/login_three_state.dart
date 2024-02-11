// ignore_for_file: must_be_immutable

part of 'login_three_bloc.dart';

/// Represents the state of LoginThree in the application.
class LoginThreeState extends Equatable {
  LoginThreeState({
    this.passwordController,
    this.isShowPassword = true,
    this.loginThreeModelObj,
  });

  TextEditingController? passwordController;

  LoginThreeModel? loginThreeModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        passwordController,
        isShowPassword,
        loginThreeModelObj,
      ];
  LoginThreeState copyWith({
    TextEditingController? passwordController,
    bool? isShowPassword,
    LoginThreeModel? loginThreeModelObj,
  }) {
    return LoginThreeState(
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      loginThreeModelObj: loginThreeModelObj ?? this.loginThreeModelObj,
    );
  }
}
