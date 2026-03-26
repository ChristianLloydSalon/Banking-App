abstract class BaseUsecase<T, Params> {
  Future<T> call(Params params);
}

class NoParams {
  const NoParams();
}
