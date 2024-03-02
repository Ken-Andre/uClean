// ignore_for_file: must_be_immutable

part of 'settings_addmanualtrippresvers_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SettingsAddmanualtrippresvers widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SettingsAddmanualtrippresversEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the SettingsAddmanualtrippresvers widget is first created.
class SettingsAddmanualtrippresversInitialEvent
    extends SettingsAddmanualtrippresversEvent {
  @override
  List<Object?> get props => [];
}
