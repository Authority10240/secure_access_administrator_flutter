import 'package:firebase_auth/firebase_auth.dart';
import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/login/data/data_source/remote/sign_in_service.dart';
import 'package:secure_access_administrator/features/login/domain/repository/login_repository/sign_in_clicked_repository.dart';

@Injectable(as: SignInClickedRepository)
class SignInClickedRepositoryImpl extends SignInClickedRepository {

  SignInClickedRepositoryImpl({required this.signInService});
  final SignInService signInService;

  @override
  Future<void> call({
    SignInClickedRepositoryParams? params,
    required Function(UserCredential? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {
    await safeBackEndCalls(apiRequest: signInService.signInClicked(
        username: params!.username,
        password: params.password),
        onSuccess: (model)=> onSuccess!(model),
        onError: (error)=> onError!(error));
  }
  

}
