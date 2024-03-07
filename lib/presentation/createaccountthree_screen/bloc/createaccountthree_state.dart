// ignore_for_file: must_be_immutable

part of 'createaccountthree_bloc.dart';

/// Represents the state of Createaccountthree in the application.
class CreateaccountthreeState extends Equatable {
  CreateaccountthreeState({
    // this.token,
    this.createaccountthreeModelObj,
  });

  CreateaccountthreeModel? createaccountthreeModelObj;

  // var token;

  @override
  List<Object?> get props => [
        // token,
        createaccountthreeModelObj,
      ];

  CreateaccountthreeState copyWith({
    // var token,
    CreateaccountthreeModel? createaccountthreeModelObj,
  }) {
    return CreateaccountthreeState(
      // token: token ?? this.token,
      createaccountthreeModelObj:
          createaccountthreeModelObj ?? this.createaccountthreeModelObj,
    );
  }
}
