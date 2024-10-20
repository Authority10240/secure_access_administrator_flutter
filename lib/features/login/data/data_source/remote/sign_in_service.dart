import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInService {

  Future<UserCredential> signInClicked({required String username, required String password});
}