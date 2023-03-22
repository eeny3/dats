import 'package:dio/dio.dart';

/// The base class for server related exceptions.
//TODO
class ServerException implements Exception {
}

/// The base class for network related exceptions.
class NetworkException implements Exception {
  final String message;

  /// Creates an instance of this class.
  NetworkException(this.message);

  /// Creates an instance of this class from DioErrorType.
  factory NetworkException.fromDioErrorType(DioErrorType errorType) {
    switch (errorType) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      //TODO локализация
        return NetworkException("Истек таймаут ожидания");

      case DioErrorType.response:
      case DioErrorType.cancel:
      case DioErrorType.other:
      //TODO локализация
        return NetworkException("Нет сети либо сервер временно недоступен");
    }
  }

  /// Gets a human readable representation of the error.
  @override
  String toString() {
    return message;
  }
}

/// The base class for application related exceptions.
class ApplicationException implements Exception {
  final dynamic error;

  /// Creates an instance of this class.
  ApplicationException(this.error);

  /// Gets a human readable representation of the error.
  @override
  String toString() {
    //TODO локализация
    return "Непредвиденная ошибка в работе приложения";
  }
}