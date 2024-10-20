import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:secure_access_administrator/core/failures/firebae_exeption.dart';
import 'package:secure_access_administrator/core/failures/runtime_exception.dart';


import 'api_exception.dart';
import 'network_exception.dart';

abstract class BaseFailure {

  factory BaseFailure.factory({required Exception ex}){
    if(ex is DioException) {
      if (ex.response!.statusCode == 400) {
        return ApiException(dioException: ex);
      }else{
        return NetworkException.getNetworkFailure(ex);
      }


    }if(ex is FirebaseAuthException){
      return FirebaseAuthenticationException(ex: ex);
  }else{
      return RuntimeException(errorCode: '0000',message: ex.toString() );
    }
  }

  BaseFailure();

  late String? message;

  late String? errorCode;
}