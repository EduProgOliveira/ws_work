import 'package:ws_work/src/core/models/user_model.dart';

abstract class IUserRepository {
  Future<UserModel?>? getUser();
  Future<bool?>? saveUser(Map<String, dynamic> map);
}
