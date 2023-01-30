import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ws_work/src/core/database/db.dart';
import 'package:ws_work/src/core/usecases/i_usecase.dart';
import 'package:ws_work/src/features/car/data/datasources/car_local_data_source.dart';
import 'package:ws_work/src/features/car/data/datasources/car_remote_data_source.dart';
import 'package:ws_work/src/features/car/data/repositories/car_repository.dart';
import 'package:ws_work/src/features/car/domain/entities/car_entity.dart';
import 'package:ws_work/src/features/car/domain/repositories/i_car_repository.dart';
import 'package:ws_work/src/features/car/domain/usecases/get_list_cars.dart';
import 'package:ws_work/src/features/car/domain/usecases/logout.dart';
import 'package:ws_work/src/features/car/domain/usecases/save_car.dart';
import 'package:ws_work/src/features/car/presentation/cubit/car_cubit.dart';
import 'package:ws_work/src/features/car/presentation/pages/car_page_list.dart';

class CarRouter {
  CarRouter._();

  static String route = "/car";

  static Widget get page => MultiProvider(
        providers: [
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
