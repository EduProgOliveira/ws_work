// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:ws_work/src/core/models/user_model.dart';

import 'package:ws_work/src/features/user/domain/usecases/get_user.dart';
import 'package:ws_work/src/features/user/domain/usecases/save_user.dart';
import 'package:ws_work/src/features/user/presentation/cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUser getUser;
  final SaveUser saveUser;

  UserCubit({
    required this.getUser,
    required this.saveUser,
  }) : super(UserState(status: UserStatus.initial, userModel: UserModel()));

  void emailChanged(String value) {
    if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      emit(state.copyWith(
        userModel: state.userModel!.copyWith(email: value),
        status: UserStatus.progress,
      ));
    } else {
      emit(state.copyWith(
        userModel: state.userModel!.copyWith(email: ''),
        status: UserStatus.progress,
      ));
    }
  }

  void nameChanged(String value) {
    if (value.isNotEmpty) {
      emit(state.copyWith(
        userModel: state.userModel!.copyWith(name: value),
        status: UserStatus.progress,
      ));
    } else {
      emit(state.copyWith(
        userModel: state.userModel!.copyWith(name: ''),
        status: UserStatus.progress,
      ));
    }
  }

  Future<void> checkCredential() async {
    if (state.isValid) {
      var result = await saveUser(map: state.userModel!.copyWith().toMap());
      if (result) {
        emit(state.copyWith(
          status: UserStatus.success,
        ));
      }
    } else {
      emit(state.copyWith(
        status: state.status == UserStatus.error
            ? UserStatus.initial
            : UserStatus.error,
      ));
    }
  }
}
