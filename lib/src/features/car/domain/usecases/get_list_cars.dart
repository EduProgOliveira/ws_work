import 'package:ws_work/src/core/usecases/i_usecase.dart';
import 'package:ws_work/src/features/car/domain/entities/car_entity.dart';
import 'package:ws_work/src/features/car/domain/repositories/i_car_repository.dart';

class GetListCars implements IUsecase<List<CarEntity>> {
  late ICarRepository repository;

  GetListCars({
    required this.repository,
  });

  @override
  Future<List<CarEntity>> call({Map<String, dynamic>? map}) async {
    List<CarEntity>? list = await repository.getListCars();
    return list ?? [];
  }
}
