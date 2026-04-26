sealed class ResuletApi<T> {}

class Success<T> extends ResuletApi<T> {
  T data;
  Success(this.data);
}

class Error<T> extends ResuletApi<T> {
  String error;
  Error(this.error);
}
