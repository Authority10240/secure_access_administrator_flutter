import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_event.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access_administrator/features/login/domain/use_cases/login_usecase/sign_in_clicked_usecase.dart';


part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc
    extends BaseBloc<LoginPageEvent, LoginPageState> {
    LoginBloc({required this.signInClickedUseCase}): super(LoginPageInitState()) {
        on<SignInClickedEvent>((event, emit)=> _onSignInClickedEvent(event, emit));
        on<PasswordVisibleEvent>((event, emit)=> _onPasswordVisibleEvent(event, emit));
    }

    Future<void> _onPasswordVisibleEvent(
        PasswordVisibleEvent event,
        Emitter<LoginPageState>emit
        )async{
        emit(PasswordVisibleState(obscure: !state.obscure)..dataState = DataState.success);
    }

    Future<void > _onSignInClickedEvent(
        SignInClickedEvent event,
        Emitter<LoginPageState> emit
        )async{
        emit(SignInClickedState(obscure: state.obscure)..dataState = DataState.loading);
        await signInClickedUseCase.call(onSuccess: (model){
            emit(SignInClickedState(
                userCredential: model,
                obscure: state.obscure)..dataState = DataState.success);

        }, onError: (error){
        emit(SignInClickedState(
        errorMessage: error!.message,
        errorCode: error!.errorCode,
            obscure: state.obscure)..dataState = DataState.error);
        },
        params: SignInClickedUseCaseParams(username: event.username, password: event.password));
    }

    final SignInClickedUseCase signInClickedUseCase;
} 
