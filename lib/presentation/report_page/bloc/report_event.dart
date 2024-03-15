// ignore_for_file: must_be_immutable

part of 'report_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Report widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ReportEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Report widget is first created.
class ReportInitialEvent extends ReportEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://x8ki-letl-twmt.n7.xano.io/api:v0yDfnCj/trips API.
class FetchTripsEvent extends ReportEvent {
  FetchTripsEvent({
    this.onFetchTripsEventSuccess,
    this.onFetchTripsEventError,
  });

  Function? onFetchTripsEventSuccess;

  Function? onFetchTripsEventError;

  @override
  List<Object?> get props => [
        onFetchTripsEventSuccess,
        onFetchTripsEventError,
      ];
}
