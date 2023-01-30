import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ws_work/src/core/database/db.dart';
import 'package:ws_work/src/features/user/data/datasources/user_local_data_source.dart';
import 'package:ws_work/src/splash/cubit/splash_cubit.dart';
import 'package:ws_work/src/splash/splash_page.dart';

class SplashRouter {
  SplashRouter._();

  static String route = "/";

  static Widget get page => MultiProvider(
        providers: [
          Provider<IUserLocalDataSource>(
            create: (context) => UserLocalDataSource(data: DB.instance),
          ),
          Provider(
            create: (context) => SplashCubit(
                userLocalDataSource: context.read<IUserLocalDataSource>()),
          ),
        ],
        builder: (context, child) {
          return const SplashPage();
        },
      );
}
