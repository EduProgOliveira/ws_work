// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ws_work/src/core/database/db.dart';

abstract class ICarLocalDataSource {
  Future<bool>? saveCar({required Map<String, dynamic> map});
  Future<bool>? logout();
}

class CarLocalDataSource implements ICarLocalDataSource {
  final DB data;
  CarLocalDataSource({
    required this.data,
  });

  @override
  Future<bool>? saveCar({required Map<String, dynamic> map}) async {
    return (await data.saveCar(map: map)) ?? false;
  }

  @override
  Future<bool>? logout() async {
    var result = await data.logout();
    return result ?? false;
  }
}
