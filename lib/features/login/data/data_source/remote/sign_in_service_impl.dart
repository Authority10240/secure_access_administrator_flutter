import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/features/login/data/data_source/remote/sign_in_service.dart';

@Injectable(as:  SignInService)
class SignInServiceImpl extends SignInService{


  SignInServiceImpl({required this.firebaseAuth});
  final FirebaseAuth firebaseAuth;
  @override
  Future<UserCredential> signInClicked({required String username, required String password}) async{
    try{
      return  await firebaseAuth.signInWithEmailAndPassword(email: username, password: password);
    }catch(ex){
      rethrow;
    }
  }

}