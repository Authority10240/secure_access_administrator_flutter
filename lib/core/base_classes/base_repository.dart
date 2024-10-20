


import '../failures/base_failure.dart';

abstract class BaseRepository<P extends BaseRepositoryParams, T>{
  Future<void> call({
    P? params,
    required Function(T? model)? onSuccess,
    required Function(BaseFailure? error)? onError
  }) ;

}

abstract class BaseRepositoryParams{}