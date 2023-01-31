import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/database/db.dart';
import '../../../core/utils/publish_lead.dart';
import '../data/datasources/car_local_data_source.dart';
import '../data/datasources/car_remote_data_source.dart';
import '../data/repositories/car_repository.dart';
import '../domain/repositories/i_car_repository.dart';
import '../domain/usecases/get_list_cars.dart';
import '../domain/usecases/logout.dart';
import '../domain/usecases/save_car.dart';
import 'cubit/car_cubit.dart';
import 'pages/car_page_list.dart';

class CarRouter {
  CarRouter._();

  static String route = "/car";

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => PublishLead(dio: Dio(), db: DB.instance),
            lazy: false,
            dispose: (context, value) {
              value.stopTime();
            },
          ),
          Provider<ICarRemoteDataSource>(
            create: (context) => CarRemoteDataSource(dio: Dio()),
          ),
          Provider<ICarLocalDataSource>(
            create: (context) => CarLocalDataSource(data: DB.instance),
          ),
          Provider<ICarRepository>(
            create: (context) => CarRepository(
              localDataSource: context.read<ICarLocalDataSource>(),
              remoteDataSource: context.read<ICarRemoteDataSource>(),
            ),
          ),
          Provider(
            create: (context) => GetListCars(
              repository: context.read<ICarRepository>(),
            ),
          ),
          Provider(
            create: (context) => SaveCar(
              repository: context.read<ICarRepository>(),
            ),
          ),
          Provider(
            create: (context) => Logout(
              repository: context.read<ICarRepository>(),
            ),
          ),
          Provider(
            create: (context) => CarCubit(
              listCarGet: context.read<GetListCars>(),
              carSave: context.read<SaveCar>(),
              logout: context.read<Logout>(),
            ),
          ),
        ],
        builder: (context, child) {
          return const CarPageList();
        },
      );
}
