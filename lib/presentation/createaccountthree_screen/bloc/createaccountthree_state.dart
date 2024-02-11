// ignore_for_file: must_be_immutable

part of 'createaccountthree_bloc.dart';

/// Represents the state of Createaccountthree in the application.
class CreateaccountthreeState extends Equatable {
  CreateaccountthreeState({this.createaccountthreeModelObj});

  CreateaccountthreeModel? createaccountthreeModelObj;

  @override
  List<Object?> get props => [
        createaccountthreeModelObj,
      ];
  CreateaccountthreeState copyWith(
      {CreateaccountthreeModel? createaccountthreeModelObj}) {
    return CreateaccountthreeState(
      createaccountthreeModelObj:
          createaccountthreeModelObj ?? this.createaccountthreeModelObj,
    );
  }
}
