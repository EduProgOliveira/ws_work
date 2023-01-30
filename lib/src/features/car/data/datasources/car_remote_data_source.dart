import 'dart:convert';

import 'package:dio/dio.dart';

import '../../domain/entities/car_entity.dart';

abstract class ICarRemoteDataSource {
  Future<List<CarEntity>?>? getListCars();
}

class CarRemoteDataSource implements ICarRemoteDataSource {
  final Dio dio;

  CarRemoteDataSource({required this.dio});

  @override
  Future<List<CarEntity>?> getListCars() async {
    List<CarEntity> listCar = [];
    var result = await dio.get('https://wswork.com.br/cars.json');

    for (var element in result.data) {
      listCar.add(CarEntity.fromMap(element));
    }
    return listCar;
  }
}
