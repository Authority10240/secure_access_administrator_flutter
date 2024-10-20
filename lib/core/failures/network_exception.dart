import 'package:dio/dio.dart';

import 'base_failure.dart';





class NetworkException extends BaseFailure{

  NetworkException({required String message, required String errorCode}){
    super.errorCode = errorCode;
    super.message = message;
  }



  factory NetworkException.getNetworkFailure(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return  NetworkException(message: 'Connection timeout', errorCode: '700');
      case DioExceptionType.sendTimeout:
        return  NetworkException(message: 'Send timeout', errorCode: '700');
      case DioExceptionType.receiveTimeout:
        return NetworkException(message: 'Receive timeout', errorCode: '700');
      case DioExceptionType.badCertificate:
        return NetworkException(message: 'Bad certificate', errorCode: '700');
      case DioExceptionType.badResponse:
        return NetworkException(message: 'Bad response', errorCode: '700');
      case DioExceptionType.cancel:
        return NetworkException(message: 'Cancelled', errorCode: '700');
      case DioExceptionType.connectionError:
        return NetworkException(message: 'Connection error', errorCode: '700');
      default:
        return NetworkException(message: error.message!, errorCode: '700');
    }
  }

}