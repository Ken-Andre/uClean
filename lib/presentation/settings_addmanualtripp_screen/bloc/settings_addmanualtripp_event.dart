// ignore_for_file: must_be_immutable

part of 'settings_addmanualtripp_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SettingsAddmanualtripp widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SettingsAddmanualtrippEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the SettingsAddmanualtripp widget is first created.
class SettingsAddmanualtrippInitialEvent extends SettingsAddmanualtrippEvent {
  @override
  List<Object?> get props => [];
}
