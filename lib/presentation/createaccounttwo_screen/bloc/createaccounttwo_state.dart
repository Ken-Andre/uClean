// ignore_for_file: must_be_immutable

part of 'createaccounttwo_bloc.dart';

/// Represents the state of Createaccounttwo in the application.
class CreateaccounttwoState extends Equatable {
  CreateaccounttwoState({
    this.otpController,
    this.createaccounttwoModelObj,
  });

  TextEditingController? otpController;

  CreateaccounttwoModel? createaccounttwoModelObj;

  @override
  List<Object?> get props => [
        otpController,
        createaccounttwoModelObj,
      ];
  CreateaccounttwoState copyWith({
    TextEditingController? otpController,
    CreateaccounttwoModel? createaccounttwoModelObj,
  }) {
    return CreateaccounttwoState(
      otpController: otpController ?? this.otpController,
      createaccounttwoModelObj:
          createaccounttwoModelObj ?? this.createaccounttwoModelObj,
    );
  }
}
