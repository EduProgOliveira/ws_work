// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ws_work/src/core/models/user_model.dart';
import 'package:ws_work/src/features/user/data/datasources/user_local_data_source.dart';
import 'package:ws_work/src/features/user/domain/repositories/i_user_repository.dart';

class UserRepository implements IUserRepository {
  final IUserLocalDataSource userLocalDataSource;

  UserRepository({
    required this.userLocalDataSource,
  });

  @override
  Future<UserModel?> getUser() async {
    Map<String, dynamic>? result = (await userLocalDataSource.getUser());
    if (result == null) return null;
    return UserModel.fromMap(result);
  }

  @override
  Future<bool> saveUser(Map<String, dynamic> map) async {
    return (await userLocalDataSource.saveUser(map: map)) ?? false;
  }
}
