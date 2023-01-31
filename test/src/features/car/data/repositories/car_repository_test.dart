import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ws_work/src/features/car/data/datasources/car_local_data_source.dart';
import 'package:ws_work/src/features/car/data/datasources/car_remote_data_source.dart';
import 'package:ws_work/src/features/car/data/models/car_model.dart';
import 'package:ws_work/src/features/car/data/repositories/car_repository.dart';
import 'package:ws_work/src/features/car/domain/repositories/i_car_repository.dart';

class MockRemoteDataSource extends Mock implements ICarRemoteDataSource {}

class MockLocalDataSource extends Mock implements ICarLocalDataSource {}

void main() {
  late ICarRepository repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    repository = CarRepository(
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group(
    'getImpCarList',
    () {
      const tListCarModel = [
        CarModel(
            id: 1,
            modelName: 'Maverick',
            brandId: 1,
            brandName: 'FORD',
            color: 'Verde',
            doorNumber: 2,
            fipePrice: 170,
            fuel: 'alcool',
            year: 1974),
        CarModel(
          id: 2,
          modelName: 'Maverick',
          brandId: 2,
          brandName: 'FORD',
          color: 'Azul',
          doorNumber: 2,
          fipePrice: 170,
          fuel: 'alcool',
          year: 1974,
        )
      ];

      group(
        'device is online',
        () {
          test('should return data from repository RemoteDataSource', () async {
            when(mockRemoteDataSource.getListCars()).thenAnswer(
              (_) async => tListCarModel,
            );
            final result = await repository.getListCars();
            verify(mockRemoteDataSource.getListCars());
            expect(result, tListCarModel);
          });
        },
      );
    },
  );
}
