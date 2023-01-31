import '../../../../core/models/user_model.dart';
import '../../../../core/usecases/i_usecase.dart';
import '../repositories/i_user_repository.dart';

class GetUser implements IUsecase<UserModel> {
  late IUserRepository repository;

  GetUser({
    required this.repository,
  });

  @override
  Future<UserModel?> call({Map<String, dynamic>? map}) async {
    UserModel? userModel = await repository.getUser();
    return userModel;
  }
}
