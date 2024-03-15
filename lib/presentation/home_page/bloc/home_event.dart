// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Home widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Home widget is first created.
class HomeInitialEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/auth/me API.
class FetchMeEvent extends HomeEvent {
  FetchMeEvent({this.onFetchMeEventError});

  Function? onFetchMeEventError;

  @override
  List<Object?> get props => [
        onFetchMeEventError,
      ];
}

/// Event that is dispatched to update the home model.
class UpdateHomeModelEvent extends HomeEvent {
  UpdateHomeModelEvent(this.updatedHomeModel);

  final HomeModel updatedHomeModel;

  @override
  List<Object?> get props => [updatedHomeModel];
}
