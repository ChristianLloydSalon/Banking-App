import '../../domain/entity/user.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/remote/auth_remote_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource remoteSource;

  AuthRepositoryImpl(this.remoteSource);

  @override
  Future<User> login({
    required String username,
    required String password,
  }) async {
    final userModel = await remoteSource.login(
      username: username,
      password: password,
    );

    return userModel.toEntity();
  }

  @override
  Future<void> logout() async {
    return remoteSource.logout();
  }
}
