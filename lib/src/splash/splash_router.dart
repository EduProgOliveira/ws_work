import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/database/db.dart';
import '../features/user/data/datasources/user_local_data_source.dart';
import 'cubit/splash_cubit.dart';
import 'splash_page.dart';

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
