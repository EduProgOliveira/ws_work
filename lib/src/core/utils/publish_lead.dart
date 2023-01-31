import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import '../database/db.dart';
import '../models/user_model.dart';

class PublishLead {
  late Timer timerNow;
  final DB db;
  List<int> idsCar = [];
  Dio dio;
  PublishLead({
    required this.db,
    required this.dio,
  }) {
    setTimer();
  }

  setTimer() {
    Timer.periodic(const Duration(minutes: 3), (Timer timer) {
      timerNow = timer;
      getList();
    });
  }

  Future getList() async {
    Map userMap = await db.getUser();
    var user = UserModel.fromMap(userMap as Map<String, dynamic>);
    Map carMap = await db.getAllCars();
    List<Map> map = [
      {'user': user.toMap()}
    ];

    carMap.forEach((key, value) {
      if (!idsCar.contains(value['id'])) {
        idsCar.add(value['id']);
        map.add({
          'cars': [value]
        });
      }
    });
    if (map.length > 1) {
      publish(map);
    }
  }

  Future publish(List<Map> map) async {
    try {
      var result = await dio.post('https://www.wswork.com.br/cars/leads/',
          data: jsonEncode(map));
      idsCar.clear();
      log(result.statusCode.toString());
    } catch (e) {
      idsCar.clear();
      await await db.deleteCars();
      log(e.toString());
    }
  }

  stopTime() {
    timerNow.cancel();
  }
}
