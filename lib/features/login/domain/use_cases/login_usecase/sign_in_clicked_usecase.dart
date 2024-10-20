
import 'package:firebase_auth/firebase_auth.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/login/domain/repository/login_repository/sign_in_clicked_repository.dart';

@Injectable()
class SignInClickedUseCase extends BaseUseCase<SignInClickedUseCaseParams, UserCredential>{

  final SignInClickedRepository signInClickedRepository;

  SignInClickedUseCase({required this.signInClickedRepository});

  @override
  Future<void> call({
    required Function(UserCredential model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    SignInClickedUseCaseParams? params})async {
    await signInClickedRepository.call(
        onSuccess: (model)=> onSuccess!(model!),
        onError: (error)=> onError!(error),
    params: SignInClickedRepositoryParams(
        password: params!.password,
        username: params.username));
  }
}

class SignInClickedUseCaseParams extends BaseUseCaseParams{

  SignInClickedUseCaseParams({required this.username, required this.password});
  final String username;
  final String password;
}
