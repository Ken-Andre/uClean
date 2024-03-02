// ignore_for_file: must_be_immutable

part of 'createaccount_bloc.dart';

/// Represents the state of Createaccount in the application.
class CreateaccountState extends Equatable {
  final String? authToken;

  CreateaccountState({
    this.userNameController,
    this.mailInputController,
    this.passwordController,
    this.confirmpasswordController,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.createaccountModelObj,
    this.authToken,
  });

  TextEditingController? userNameController;

  TextEditingController? mailInputController;

  TextEditingController? passwordController;

  TextEditingController? confirmpasswordController;

  CreateaccountModel? createaccountModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  @override
  List<Object?> get props => [
        userNameController,
        mailInputController,
        passwordController,
        confirmpasswordController,
        isShowPassword,
        isShowPassword1,
        createaccountModelObj,
        authToken,
      ];

  CreateaccountState copyWith({
    TextEditingController? userNameController,
    TextEditingController? mailInputController,
    TextEditingController? passwordController,
    TextEditingController? confirmpasswordController,
    bool? isShowPassword,
    bool? isShowPassword1,
    CreateaccountModel? createaccountModelObj,
    String? authToken,
  }) {
    return CreateaccountState(
      userNameController: userNameController ?? this.userNameController,
      mailInputController: mailInputController ?? this.mailInputController,
      passwordController: passwordController ?? this.passwordController,
      confirmpasswordController:
          confirmpasswordController ?? this.confirmpasswordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      createaccountModelObj:
          createaccountModelObj ?? this.createaccountModelObj,
    );
  }
}
