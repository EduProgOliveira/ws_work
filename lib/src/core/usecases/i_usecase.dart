abstract class IUsecase<Type> {
  Future<Type?> call({Map<String, dynamic>? map});
}
