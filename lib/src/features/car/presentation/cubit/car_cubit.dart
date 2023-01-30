import 'package:bloc/bloc.dart';
import 'package:ws_work/src/features/car/domain/entities/car_entity.dart';
import 'package:ws_work/src/features/car/domain/usecases/get_list_cars.dart';
import 'package:ws_work/src/features/car/domain/usecases/logout.dart';
import 'package:ws_work/src/features/car/domain/usecases/save_car.dart';

part 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  final GetListCars listCarGet;
  final SaveCar carSave;
  final Logout logout;
  List<CarEntity>? carModel;

  CarCubit({
    required this.logout,
    required this.listCarGet,
    required this.carSave,
    this.carModel,
  }) : super(CarState(status: CarStatus.initial));

  Future getListCars() async {
    emit(state.copyWith(status: CarStatus.loading));
    carModel = await listCarGet();
    if (carModel == null && carModel!.isNotEmpty) {
      emit(state.copyWith(status: CarStatus.error));
    }
    emit(state.copyWith(listCar: carModel, status: CarStatus.loaded));
  }

  saveCar(CarEntity carEntity) async {
    var result = await carSave(map: carEntity.toMap());
    if (result!) {
      emit(state.copyWith(status: CarStatus.saveCar));
    } else {
      emit(state.copyWith(status: CarStatus.saveCarBad));
    }
  }

  logOut() async {
    var result = await logout();
    if (result!) {
      emit(state.copyWith(status: CarStatus.logout));
    }
  }
}
