import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:ws_work/src/features/car/data/models/car_model.dart';
import 'package:ws_work/src/features/car/domain/entities/car_entity.dart';

import '../../../../../mock/mock_reader.dart';

void main() {
  late List<CarModel> tListCarModel = [];
  late CarModel tCarModel;

  setUp(() {
    tListCarModel = [
      const CarModel(
        id: 1,
        modelName: 'COROLLA XEI',
        brandId: 1,
        brandName: 'TOYOTA',
        year: 2016,
        fuel: 'flex',
        doorNumber: 4,
        fipePrice: 70,
        color: 'Azul',
      ),
      const CarModel(
        id: 17,
        modelName: 'KA',
        brandId: 0,
        brandName: 'FORD',
        year: 2013,
        fuel: 'flex',
        doorNumber: 4,
        fipePrice: 50000,
        color: 'verde',
      ),
    ];
    tCarModel = const CarModel(
      id: 1,
      modelName: 'COROLLA XEI',
      brandId: 1,
      brandName: 'TOYOTA',
      year: 2016,
      fuel: 'flex',
      doorNumber: 4,
      fipePrice: 70,
      color: 'Azul',
    );
  });

  test('should be a subclass of CarEntity', () async {
    expect(tListCarModel, isA<List<CarEntity>>());
  });

  group('Car from Json', () {
    test('should return a valid model JSON car', () async {
      final json = mock('car.json');
      final result = CarModel.fromJson(json);

      expect(result, tCarModel);
    });

    test('should return a valid list model JSON car', () async {
      final json = mock('car_list.json');
      final listCar = jsonDecode(json) as List;
      List<CarModel> result = [];
      for (var element in listCar) {
        result.add(CarModel.fromMap(element));
      }

      expect(result.first, tListCarModel.first);
      expect(result.last, tListCarModel.last);
    });
  });
}
