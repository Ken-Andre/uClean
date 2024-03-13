// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfileModel extends Equatable {
  ProfileModel({
    this.isabelleKarol = "Isabelle Karol",
    this.sixHundredFortyMillionSevenHun = "+237 692645094",
    this.email = "isabelle.karol@ucac-icam.com",
  }) {}

  String isabelleKarol;

  String sixHundredFortyMillionSevenHun;

  String email;

  ProfileModel copyWith({
    String? isabelleKarol,
    String? sixHundredFortyMillionSevenHun,
    String? email,
  }) {
    return ProfileModel(
      isabelleKarol: isabelleKarol ?? this.isabelleKarol,
      sixHundredFortyMillionSevenHun:
      sixHundredFortyMillionSevenHun ?? this.sixHundredFortyMillionSevenHun,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props =>
      [isabelleKarol, sixHundredFortyMillionSevenHun, email];
}
