import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/database/db.dart';
import '../data/datasources/user_local_data_source.dart';
import '../data/repositories/user_repository.dart';
import '../domain/repositories/i_user_repository.dart';
import '../domain/usecases/get_user.dart';
import '../domain/usecases/save_user.dart';
import 'cubit/user_cubit.dart';
import 'pages/user_page.dart';

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
