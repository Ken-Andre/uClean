// ignore_for_file: must_be_immutable

part of 'recoveraccounttwo_bloc.dart';

/// Represents the state of Recoveraccounttwo in the application.
class RecoveraccounttwoState extends Equatable {
  RecoveraccounttwoState({
    this.passwordController,
    this.confirmpasswordController,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.email,
    this.recoveraccounttwoModelObj,
  });

  TextEditingController? passwordController;

  TextEditingController? confirmpasswordController;

  RecoveraccounttwoModel? recoveraccounttwoModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  var email;

  @override
  List<Object?> get props => [
        passwordController,
        confirmpasswordController,
        isShowPassword,
        isShowPassword1,
        email,
        recoveraccounttwoModelObj,
      ];
  RecoveraccounttwoState copyWith({
    TextEditingController? passwordController,
    TextEditingController? confirmpasswordController,
    bool? isShowPassword,
    bool? isShowPassword1,
    var email,
    RecoveraccounttwoModel? recoveraccounttwoModelObj,
  }) {
    return RecoveraccounttwoState(
      passwordController: passwordController ?? this.passwordController,
      confirmpasswordController:
          confirmpasswordController ?? this.confirmpasswordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      email: email ?? this.email,
      recoveraccounttwoModelObj:
          recoveraccounttwoModelObj ?? this.recoveraccounttwoModelObj,
    );
  }
}
