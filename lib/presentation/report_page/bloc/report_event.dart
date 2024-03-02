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
