import 'package:dio/dio.dart';

class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with api server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with api server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with api server');

      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate Timeout with api server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to api server was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('No internet Connection');

      case DioExceptionType.unknown:
        return ServerFailure(
            'Oops, there was an error, please try again later');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
          'Your request was not found, please try again later');
    } else if (statusCode >= 500) {
      return ServerFailure(
          'there is problem with server , please try again later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure('Error');
    } else {
      return ServerFailure('There was an error please try again');
    }
  }
}

// class CacheFailure extends Failure {}
//
// class NetworkFailure extends Failure {}
