// ignore_for_file: must_be_immutable

part of 'settingspage_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Settingspage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SettingspageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Settingspage widget is first created.
class SettingspageInitialEvent extends SettingspageEvent {
  @override
  List<Object?> get props => [];
}
