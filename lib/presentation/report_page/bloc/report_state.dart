// ignore_for_file: must_be_immutable

part of 'report_bloc.dart';

/// Represents the state of Report in the application.
class ReportState extends Equatable {
  ReportState({this.reportModelObj});

  ReportModel? reportModelObj;

  @override
  List<Object?> get props => [
        reportModelObj,
      ];

  ReportState copyWith({ReportModel? reportModelObj}) {
    return ReportState(
      reportModelObj: reportModelObj ?? this.reportModelObj,
    );
  }
}
