part of 'car_cubit.dart';

enum CarStatus { initial, loading, loaded, error, saveCar, saveCarBad, logout }

class CarState {
  CarState({
    required this.status,
    this.listCar,
    this.carEntity,
  });

  final List<CarEntity>? listCar;
  final CarEntity? carEntity;
  final CarStatus status;

  CarState copyWith(
      {CarEntity? carEntity, List<CarEntity>? listCar, CarStatus? status}) {
    return CarState(
      carEntity: carEntity ?? this.carEntity,
      listCar: listCar ?? this.listCar,
      status: status ?? this.status,
    );
  }
}
