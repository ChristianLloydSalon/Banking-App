import '../../../../core/usecase/base_usecase.dart';
import '../entity/user.dart';
import '../repository/auth_repository.dart';

class LoginUser implements BaseUsecase<User, LoginParams> {
  final AuthRepository repository;

  LoginUser(this.repository);

  @override
  Future<User> call(LoginParams params) {
    return repository.login(
      username: params.username,
      password: params.password,
    );
  }
}

class LoginParams {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});
}
