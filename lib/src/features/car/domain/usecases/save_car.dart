// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ws_work/src/core/usecases/i_usecase.dart';
import 'package:ws_work/src/features/car/domain/repositories/i_car_repository.dart';

class SaveCar implements IUsecase<bool> {
  final ICarRepository repository;

  SaveCar({
    required this.repository,
  });

  @override
  Future<bool?> call({Map<String, dynamic>? map}) async {
    return await repository.saveCar(map: map!);
  }
}
