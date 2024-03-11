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

///Event that is dispatched when the user calls the https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/trips_maps API.
class CreateTripsMapsEvent extends SettingsAddmanualtrippEvent {
  CreateTripsMapsEvent({
    this.onCreateTripsMapsEventSuccess,
    this.onCreateTripsMapsEventError,
  });

  Function? onCreateTripsMapsEventSuccess;

  Function? onCreateTripsMapsEventError;

  @override
  List<Object?> get props => [
    onCreateTripsMapsEventSuccess,
    onCreateTripsMapsEventError,
  ];
}

///event for dropdown selection
class ChangeDropDownEvent extends SettingsAddmanualtrippEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
    value,
  ];
}
