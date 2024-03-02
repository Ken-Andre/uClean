// ignore_for_file: must_be_immutable

part of 'settings_auto_track_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SettingsAutoTrack widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SettingsAutoTrackEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the SettingsAutoTrack widget is first created.
class SettingsAutoTrackInitialEvent extends SettingsAutoTrackEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing switch
class ChangeSwitchEvent extends SettingsAutoTrackEvent {
  ChangeSwitchEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
