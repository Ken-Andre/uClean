// ignore_for_file: must_be_immutable

part of 'settingsautotrack_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Settingsautotrack widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SettingsautotrackEvent extends Equatable {}

/// Event that is dispatched when the Settingsautotrack widget is first created.
class SettingsautotrackInitialEvent extends SettingsautotrackEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing switch
class ChangeSwitchEvent extends SettingsautotrackEvent {
  ChangeSwitchEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
