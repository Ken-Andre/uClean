// ignore_for_file: must_be_immutable

part of 'recoveraccount_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Recoveraccount widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RecoveraccountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Recoveraccount widget is first created.
class RecoveraccountInitialEvent extends RecoveraccountEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends RecoveraccountEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
