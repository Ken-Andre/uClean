// ignore_for_file: must_be_immutable

part of 'recoveraccount_bloc.dart';

/// Represents the state of Recoveraccount in the application.
class RecoveraccountState extends Equatable {
  RecoveraccountState({
    this.otpController,
    this.recoveraccountModelObj,
  });

  TextEditingController? otpController;

  RecoveraccountModel? recoveraccountModelObj;

  @override
  List<Object?> get props => [
        otpController,
        recoveraccountModelObj,
      ];
  RecoveraccountState copyWith({
    TextEditingController? otpController,
    RecoveraccountModel? recoveraccountModelObj,
  }) {
    return RecoveraccountState(
      otpController: otpController ?? this.otpController,
      recoveraccountModelObj:
          recoveraccountModelObj ?? this.recoveraccountModelObj,
    );
  }
}
