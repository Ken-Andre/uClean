// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel extends Equatable {
  HomeModel({
    this.welcomeIsabelle = "Welcome",
    this.gamingPoints = "0",
    this.isautoTracked = false,
  }) {}

  String welcomeIsabelle;
  String gamingPoints;
  bool isautoTracked;

  HomeModel copyWith({
    String? welcomeIsabelle,
    String? gamingPoints,
    bool? isautoTracked,
  }) {
    return HomeModel(
      welcomeIsabelle: welcomeIsabelle ?? this.welcomeIsabelle,
      gamingPoints: gamingPoints ?? this.gamingPoints,
      isautoTracked: isautoTracked ?? this.isautoTracked,
    );
  }

  @override
  List<Object?> get props => [welcomeIsabelle, gamingPoints, isautoTracked];
}
