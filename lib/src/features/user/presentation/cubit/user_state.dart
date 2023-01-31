import '../../../../core/models/user_model.dart';

enum UserStatus { initial, progress, formError, submit, success, error }

class UserState {
  final UserModel? userModel;
  final UserStatus status;

  UserState({
    this.userModel,
    required this.status,
  });

  UserState copyWith({UserModel? userModel, UserStatus? status}) {
    return UserState(
      userModel: userModel ?? this.userModel,
      status: status ?? this.status,
    );
  }

  bool get isValid =>
      (userModel!.email != null && userModel!.email!.isNotEmpty) &&
      (userModel!.name != null && userModel!.name!.isNotEmpty);
}
