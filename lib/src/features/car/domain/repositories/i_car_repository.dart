import '../entities/car_entity.dart';

abstract class ICarRepository {
  Future<List<CarEntity>>? getListCars();
  Future<bool>? saveCar({required Map<String, dynamic> map});
  Future<bool>? logout();
}
