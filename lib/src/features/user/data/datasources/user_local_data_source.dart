// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ws_work/src/core/database/db.dart';

abstract class IUserLocalDataSource {
  Future<bool>? saveUser({required Map<String, dynamic> map});
  Future<Map<String, dynamic>?>? getUser();
}

class UserLocalDataSource implements IUserLocalDataSource {
  final DB data;

  UserLocalDataSource({
    required this.data,
  });

  @override
  Future<bool>? saveUser({required Map<String, dynamic> map}) async {
    return (await data.saveUser(map: map));
  }

  @override
  Future<Map<String, dynamic>?>? getUser() async {
    return await data.getUser();
  }
}
