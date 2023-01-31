import '../../../../core/usecases/i_usecase.dart';
import '../repositories/i_user_repository.dart';

class SaveUser implements IUsecase<bool> {
  late IUserRepository repository;

  SaveUser({
    required this.repository,
  });

  @override
  Future<bool> call({Map<String, dynamic>? map}) async {
    return await repository.saveUser(map!) ?? false;
  }
}
