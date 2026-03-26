import '../data/data_source/remote/auth_remote_source.dart';
import '../data/repository/auth_repository_impl.dart';
import '../domain/usecase/login_user.dart';
import '../domain/usecase/logout_user.dart';

final authRemoteSource = AuthRemoteSource();
final authRepository = AuthRepositoryImpl(authRemoteSource);
final loginUser = LoginUser(authRepository);
final logoutUser = LogoutUser(authRepository);
