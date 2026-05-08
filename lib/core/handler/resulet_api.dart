sealed class ResultApi<T> {}

class SuccessApi<T> extends ResultApi<T> {
  T data;
  SuccessApi(this.data);
}

class ErrorApi<T> extends ResultApi<T> {
  String error;
  ErrorApi(this.error);
}
