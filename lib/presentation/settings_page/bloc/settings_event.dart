// ignore_for_file: must_be_immutable

part of 'settings_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Settings widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SettingsEvent extends Equatable {}

/// Event that is dispatched when the Settings widget is first created.
class SettingsInitialEvent extends SettingsEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://nodedemo.dhiwise.co/device/api/v1/user/list API.
class CreateListEvent extends SettingsEvent {
  CreateListEvent({this.onCreateListEventSuccess});

  Function? onCreateListEventSuccess;

  @override
  List<Object?> get props => [
        onCreateListEventSuccess,
      ];
}
