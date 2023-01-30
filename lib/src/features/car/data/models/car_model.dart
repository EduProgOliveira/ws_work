import 'dart:convert';

import 'package:ws_work/src/features/car/domain/entities/car_entity.dart';

class CarModel extends CarEntity {
  const CarModel({
    required super.id,
    required super.modelName,
    required super.brandId,
    required super.brandName,
    required super.year,
    required super.fuel,
    required super.doorNumber,
    required super.fipePrice,
    required super.color,
  });

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      id: map['id'] as int,
      modelName: map['nome_modelo'] as String,
      brandId: map['marca_id'] as int,
      brandName: map['marca_nome'] as String,
      year:
          map['ano'].runtimeType == String ? int.parse(map['ano']) : map['ano'],
      fuel: map['combustivel'] as String,
      doorNumber: map['num_portas'] as int,
      fipePrice: map['valor_fipe'].runtimeType == String
          ? double.parse(map['valor_fipe'])
          : (map['valor_fipe'] as num).toDouble(),
      color: map['cor'] as String,
    );
  }

  factory CarModel.fromJson(String source) =>
      CarModel.fromMap(jsonDecode(source));
}
