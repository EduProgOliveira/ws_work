import '../../../../core/usecases/i_usecase.dart';
import '../entities/car_entity.dart';
import '../repositories/i_car_repository.dart';

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
