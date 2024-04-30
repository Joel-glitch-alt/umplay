import 'package:dio/dio.dart';

abstract class DataState<T> {
  T? data;
  final DioException? error;

  DataState(this.data, this.error);
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data, null);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(DioException error) : super(null, error);
}
