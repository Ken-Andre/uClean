// ignore_for_file: must_be_immutable

part of 'notifspanel_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Notifspanel widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class NotifspanelEvent extends Equatable {}

/// Event that is dispatched when the Notifspanel widget is first created.
class NotifspanelInitialEvent extends NotifspanelEvent {
  @override
  List<Object?> get props => [];
}
