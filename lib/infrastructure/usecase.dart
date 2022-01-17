abstract class Usecase {
  Future<void> dispose();
}

abstract class QueryStreamUsecase<T> extends Usecase {
  Stream<T> stream();
}

abstract class QueryGetUsecase<T> extends Usecase {
  Future<T> get();
}

abstract class CommandUsecase<TData, TResult> extends Usecase {
  Future<TResult> execute(TData data);
}
