
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';

import '../../repository/properties_repository/properties_delete_block_repository.dart';

@Injectable()
class PropertiesDeleteBlockUseCase extends BaseUseCase<PropertiesDeleteBlockUseCaseParams, bool>{

  final PropertiesDeleteBlockRepository propertiesDeleteBlockRepository;

  PropertiesDeleteBlockUseCase({required this.propertiesDeleteBlockRepository});

  @override
  Future<void> call({
    required Function(bool? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    PropertiesDeleteBlockUseCaseParams? params}) async{
    await propertiesDeleteBlockRepository.call(
        onSuccess: (model)=> onSuccess!(model), 
        onError:(error)=> onError!(error),
    params: PropertiesDeleteBlockRepositoryParams(blockId: params!.blockId));
  }
}

class PropertiesDeleteBlockUseCaseParams extends BaseUseCaseParams{

  final String blockId;

  PropertiesDeleteBlockUseCaseParams({required this.blockId});
}
