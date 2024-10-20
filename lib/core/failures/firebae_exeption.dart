import 'package:firebase_auth/firebase_auth.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';

class FirebaseAuthenticationException extends BaseFailure{

  FirebaseAuthenticationException({required FirebaseAuthException ex}){
    message = ex.message;
    errorCode = ex.code;
  }
}