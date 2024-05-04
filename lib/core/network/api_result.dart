import 'package:umplay/core/network/error_handler.dart';

class ApiResult<T> {
  ErrorHandler? _exception;
  T? _data;

  setException(ErrorHandler error) {
    _exception = error;
  }

  setData(T data) {
    _data = data;
  }

  get data {
    return _data;
  }

  get getException {
    return _exception;
  }
}
