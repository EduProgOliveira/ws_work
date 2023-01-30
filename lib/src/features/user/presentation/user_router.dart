import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ws_work/src/core/database/db.dart';
import 'package:ws_work/src/core/usecases/i_usecase.dart';
import 'package:ws_work/src/features/user/data/datasources/user_local_data_source.dart';
import 'package:ws_work/src/features/user/data/repositories/user_repository.dart';
import 'package:ws_work/src/features/user/domain/repositories/i_user_repository.dart';
import 'package:ws_work/src/features/user/domain/usecases/get_user.dart';
import 'package:ws_work/src/features/user/domain/usecases/save_user.dart';
import 'package:ws_work/src/features/user/presentation/cubit/user_cubit.dart';
import 'package:ws_work/src/features/user/presentation/pages/user_page.dart';

class UserRouter {
  UserRouter._();

  static String route = "/user";

  static Widget get page => MultiProvider(
        providers: [
          Provider<IUserLocalDataSource>(
            create: (context) => UserLocalDataSource(data: DB.instance),
          ),
          Provider<IUserRepository>(
            create: (context) => UserRepository(
              userLocalDataSource: context.read<IUserLocalDataSource>(),
            ),
          ),
          Provider(
            create: (context) => SaveUser(
              repository: context.read<IUserRepository>(),
            ),
          ),
          Provider(
            create: (context) => GetUser(
              repository: context.read<IUserRepository>(),
            ),
          ),
          Provider(
            create: (context) => UserCubit(
                getUser: context.read<GetUser>(),
                saveUser: context.read<SaveUser>()),
          ),
        ],
        builder: (context, child) {
          return const UserPage();
        },
      );
}
