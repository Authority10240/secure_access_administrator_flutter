

import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/properties/domain/repository/properties_repository/properties_add_block_clicked_repository.dart';
import 'package:secure_access_repository/models/secure_access_block_model/secure_access_blocks_model.dart';
import 'package:secure_access_repository/models/secure_access_property_model/secure_access_properties_model.dart';

@Injectable()
class PropertiesAddBlockClickedUseCase extends BaseUseCase<PropertiesAddBlockClickedUseCaseParams, bool>{

  final PropertiesAddBlockClickedRepository propertiesAddBlockClickedRepository;

  PropertiesAddBlockClickedUseCase({required this.propertiesAddBlockClickedRepository});

  @override
  Future<void> call({
    required Function(bool? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    PropertiesAddBlockClickedUseCaseParams? params}) async{

   await propertiesAddBlockClickedRepository.call(
        onSuccess: (model)=> onSuccess!(model) ,
        onError: (error)=> onError!(error),
    params: PropertiesAddBlockClickedRepositoryParams(
        secureAccessBlocksModel: params!.secureAccessBlocksModel));

  }
}

class PropertiesAddBlockClickedUseCaseParams extends BaseUseCaseParams{
  final SecureAccessBlocksModel secureAccessBlocksModel;

  PropertiesAddBlockClickedUseCaseParams({required this.secureAccessBlocksModel});
}
