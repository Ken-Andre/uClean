// ignore_for_file: must_be_immutable

part of 'notifspanel_bloc.dart';

/// Represents the state of Notifspanel in the application.
class NotifspanelState extends Equatable {
  NotifspanelState({this.notifspanelModelObj});

  NotifspanelModel? notifspanelModelObj;

  @override
  List<Object?> get props => [
        notifspanelModelObj,
      ];

  NotifspanelState copyWith({NotifspanelModel? notifspanelModelObj}) {
    return NotifspanelState(
      notifspanelModelObj: notifspanelModelObj ?? this.notifspanelModelObj,
    );
  }
}
