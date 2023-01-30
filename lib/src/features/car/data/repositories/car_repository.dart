// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ws_work/src/features/car/data/datasources/car_local_data_source.dart';
import 'package:ws_work/src/features/car/data/datasources/car_remote_data_source.dart';
import 'package:ws_work/src/features/car/domain/entities/car_entity.dart';
import 'package:ws_work/src/features/car/domain/repositories/i_car_repository.dart';

class CarRepository implements ICarRepository {
  ICarRemoteDataSource remoteDataSource;
  ICarLocalDataSource localDataSource;

  CarRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<CarEntity>> getListCars() async {
    return await remoteDataSource.getListCars() ?? [];
  }

  @override
  Future<bool> saveCar({required Map<String, dynamic> map}) async {
    return await localDataSource.saveCar(map: map) ?? false;
  }

  @override
  Future<bool>? logout() async {
    return await localDataSource.logout() ?? false;
  }
}
