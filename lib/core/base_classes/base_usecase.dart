

import '../failures/base_failure.dart';

abstract class BaseUseCase<P extends BaseUseCaseParams, T>{

  Future<void>call({
    required Function(T? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    P? params
  });

}

abstract class BaseUseCaseParams{}