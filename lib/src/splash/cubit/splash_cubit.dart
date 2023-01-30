// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:ws_work/src/features/user/data/datasources/user_local_data_source.dart';
import 'package:ws_work/src/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final IUserLocalDataSource userLocalDataSource;
  SplashCubit({
    required this.userLocalDataSource,
  }) : super(SplashState(status: SplashStatus.loading));

  checkAuth() async {
    emit(state.copyWith(
        status: (await userLocalDataSource.getUser()) == null
            ? SplashStatus.unauthenticated
            : SplashStatus.authenticated));
    return;
  }
}
