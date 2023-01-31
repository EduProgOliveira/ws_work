// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarEntity extends Equatable {
  final int id;
  final int brandId;
  final String brandName;
  final String modelName;
  final int year;
  final String fuel;
  final int doorNumber;
  final double fipePrice;
  final String color;

  const CarEntity({
    required this.id,
    required this.modelName,
    required this.brandId,
    required this.brandName,
    required this.year,
    required this.fuel,
    required this.doorNumber,
    required this.fipePrice,
    required this.color,
  });

  @override
  List<Object?> get props => [
        id,
        modelName,
        brandId,
        brandName,
        year,
        fuel,
        doorNumber,
        fipePrice,
        color,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome_modelo': modelName,
      'marca_id': brandId,
      'marca_nome': brandName,
      'ano': year,
      'combustivel': fuel,
      'num_portas': doorNumber,
      'valor_fipe': fipePrice,
      'cor': color,
    };
  }

  factory CarEntity.fromMap(Map<String, dynamic> map) {
    return CarEntity(
      id: map['id'] as int,
      modelName: map['nome_modelo'] as String,
      brandId: map['marca_id'] as int,
      brandName: map['marca_nome'] as String,
      year:
          map['ano'].runtimeType == String ? int.parse(map['ano']) : map['ano'],
      fuel: map['combustivel'] as String,
      doorNumber: map['num_portas'].runtimeType == String
          ? int.parse(map['num_portas'])
          : map['num_portas'] as int,
      fipePrice: map['valor_fipe'].runtimeType == String
          ? double.parse(map['valor_fipe'])
          : (map['valor_fipe'] as num).toDouble(),
      color: map['cor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarEntity.fromJson(String source) =>
      CarEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  Color colorCar() {
    switch (color.toLowerCase()) {
      case 'verde':
        return Colors.green;
      case 'vermelho':
        return Colors.red;
      case 'vermelha':
        return Colors.red;
      case 'vinho':
        return const Color(0xFFFF5252);
      case 'amarelo':
        return Colors.amber;
      case 'amarela':
        return Colors.amber;
      case 'azul':
        return Colors.blue;
      case 'marrom':
        return Colors.brown;
      case 'rosa':
        return Colors.pink;
      default:
        return Colors.black;
    }
  }

  String typeFuel() {
    switch (fuel.toLowerCase()) {
      case 'alcool':
        return 'Alcool';
      case 'gasolina':
        return 'Gasolina';
      default:
        return 'Flex';
    }
  }

  formatPrice() {
    return NumberFormat('###,##0.##', 'pt_BR').format(fipePrice);
  }
}
