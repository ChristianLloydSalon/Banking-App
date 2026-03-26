import '../../../../core/usecase/base_usecase.dart';
import '../repository/auth_repository.dart';

class LogoutUser implements BaseUsecase<void, NoParams> {
  final AuthRepository repository;

  LogoutUser(this.repository);

  @override
  Future<void> call(NoParams params) {
    return repository.logout();
  }
}
