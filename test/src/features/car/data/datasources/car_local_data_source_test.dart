import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ws_work/src/features/car/data/datasources/car_local_data_source.dart';

class MockSqflite extends Mock implements Sqflite {}

class MockCarLocalDataSource extends Mock implements ICarLocalDataSource {}

void main() {
  late ICarLocalDataSource localDataSource;
  late MockSqflite mockSqflite;

  setUp(() {
    mockSqflite = MockSqflite();
    localDataSource = MockCarLocalDataSource();

    test('should return true save CarEntity', () {});
  });
}
