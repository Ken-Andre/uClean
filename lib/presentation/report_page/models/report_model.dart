// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [report_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ReportModel extends Equatable {
  ReportModel() {}

  ReportModel copyWith() {
    return ReportModel();
  }

  @override
  List<Object?> get props => [];
}
