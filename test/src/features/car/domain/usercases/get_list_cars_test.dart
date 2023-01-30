import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ws_work/src/core/usecases/i_usecase.dart';
import 'package:ws_work/src/features/car/domain/entities/car_entity.dart';
import 'package:ws_work/src/features/car/domain/repositories/i_car_repository.dart';
import 'package:ws_work/src/features/car/domain/usecases/get_list_cars.dart';

class MockCarRepository extends Mock implements ICarRepository {}

void main() {
  late IUsecase usecase;
  late MockCarRepository mockCarRepository;

  setUp(() {
    mockCarRepository = MockCarRepository();
    usecase = GetListCars(repository: mockCarRepository);
  });

  List<CarEntity> tListCars = [
    const CarEntity(
        id: 1,
        modelName: 'ModelName',
        brandId: 1,
        brandName: 'brandName',
        year: 2022,
        fuel: 'fuel',
        doorNumber: 4,
        fipePrice: 70,
        color: 'color'),
  ];

  test('should repository car list from repository', () async {
    when(mockCarRepository.getListCars()).thenAnswer((_) async {
      return tListCars;
    });
    final result = await usecase();
    expect(result, tListCars);
    verify(mockCarRepository.getListCars());
  });
}
