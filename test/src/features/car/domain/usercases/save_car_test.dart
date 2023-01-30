import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ws_work/src/core/usecases/i_usecase.dart';
import 'package:ws_work/src/features/car/data/models/car_model.dart';
import 'package:ws_work/src/features/car/domain/repositories/i_car_repository.dart';
import 'package:ws_work/src/features/car/domain/usecases/save_car.dart';

class MockCarRepository extends Mock implements ICarRepository {}

void main() {
  late IUsecase usecase;
  late MockCarRepository mockCarRepository;

  setUp(() {
    mockCarRepository = MockCarRepository();
    usecase = SaveCar(repository: mockCarRepository);
  });

  CarModel tCarModel = const CarModel(
    id: 2,
    modelName: 'Maverick',
    brandId: 2,
    brandName: 'FORD',
    color: 'Azul',
    doorNumber: 2,
    fipePrice: 170,
    fuel: 'alcool',
    year: 1974,
  );

  test('should repository car list from repository', () async {
    when<Future<bool>?>(mockCarRepository.saveCar(map: tCarModel.toMap()))
        .thenAnswer((_) async {
      return true;
    });
    final result = await usecase(map: tCarModel.toMap()) ?? false;
    expect(result, true);
    verify(mockCarRepository.saveCar(map: tCarModel.toMap()));
  });
}
