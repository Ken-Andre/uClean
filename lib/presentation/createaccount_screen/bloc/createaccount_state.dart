// ignore_for_file: must_be_immutable

part of 'createaccount_bloc.dart';

/// Represents the state of Createaccount in the application.
class CreateaccountState extends Equatable {
  CreateaccountState({
    this.nameEditTextController,
    this.surnameEditTextController,
    this.surnameEditText2Controller,
    this.mailValueEditTextController,
    this.passwordEditTextController,
    this.confirmPasswordEditTextController,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.createaccountModelObj,
  });

  TextEditingController? nameEditTextController;

  TextEditingController? surnameEditTextController;

  TextEditingController? surnameEditText2Controller;

  TextEditingController? mailValueEditTextController;

  TextEditingController? passwordEditTextController;

  TextEditingController? confirmPasswordEditTextController;

  CreateaccountModel? createaccountModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  @override
  List<Object?> get props => [
        nameEditTextController,
        surnameEditTextController,
        surnameEditText2Controller,
        mailValueEditTextController,
        passwordEditTextController,
        confirmPasswordEditTextController,
        isShowPassword,
        isShowPassword1,
        createaccountModelObj,
      ];
  CreateaccountState copyWith({
    TextEditingController? nameEditTextController,
    TextEditingController? surnameEditTextController,
    TextEditingController? surnameEditText2Controller,
    TextEditingController? mailValueEditTextController,
    TextEditingController? passwordEditTextController,
    TextEditingController? confirmPasswordEditTextController,
    bool? isShowPassword,
    bool? isShowPassword1,
    CreateaccountModel? createaccountModelObj,
  }) {
    return CreateaccountState(
      nameEditTextController:
          nameEditTextController ?? this.nameEditTextController,
      surnameEditTextController:
          surnameEditTextController ?? this.surnameEditTextController,
      surnameEditText2Controller:
          surnameEditText2Controller ?? this.surnameEditText2Controller,
      mailValueEditTextController:
          mailValueEditTextController ?? this.mailValueEditTextController,
      passwordEditTextController:
          passwordEditTextController ?? this.passwordEditTextController,
      confirmPasswordEditTextController: confirmPasswordEditTextController ??
          this.confirmPasswordEditTextController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      createaccountModelObj:
          createaccountModelObj ?? this.createaccountModelObj,
    );
  }
}
