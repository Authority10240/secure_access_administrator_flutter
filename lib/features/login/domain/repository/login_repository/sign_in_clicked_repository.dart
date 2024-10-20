import 'package:firebase_auth/firebase_auth.dart';
import 'package:secure_access_administrator/core/base_classes/base_repository.dart';

abstract class SignInClickedRepository  extends BaseRepository<SignInClickedRepositoryParams, UserCredential>{}

class SignInClickedRepositoryParams extends BaseRepositoryParams{

  final String username;
  final String password;

  SignInClickedRepositoryParams({required this.password, required this.username});
}
