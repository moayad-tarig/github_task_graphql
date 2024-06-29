sealed class ResultApi<T> {}

class Success<T> extends ResultApi<T> {
  final T data;

  Success(this.data);
}

class Failure<T> extends ResultApi<T> {
  final String Error;

  Failure(this.Error);
}
