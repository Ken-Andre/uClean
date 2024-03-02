// ignore_for_file: must_be_immutable

part of 'settings_contactus_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SettingsContactus widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SettingsContactusEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the SettingsContactus widget is first created.
class SettingsContactusInitialEvent extends SettingsContactusEvent {
  @override
  List<Object?> get props => [];
}
