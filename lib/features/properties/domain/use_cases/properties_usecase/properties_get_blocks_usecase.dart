

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/properties/domain/repository/properties_repository/properties_get_blocks_repository.dart';
import 'package:secure_access_repository/models/secure_access_block_model/secure_access_blocks_model.dart';

@Injectable()
class PropertiesGetBlocksUseCase extends BaseUseCase<PropertiesGetBlocksUseCaseParams, Stream<QuerySnapshot<SecureAccessBlocksModel?>>>{

  final PropertiesGetBlocksRepository propertiesGetBlocksRepository;

  PropertiesGetBlocksUseCase({required this.propertiesGetBlocksRepository});

  @override
  Future<void> call({
    required Function(Stream<QuerySnapshot<SecureAccessBlocksModel?>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    PropertiesGetBlocksUseCaseParams? params}) async {
      await propertiesGetBlocksRepository.call(
        onSuccess:(model)=> onSuccess!(model),
        onError:(error)=> onError!(error),
      );
  }
}

class PropertiesGetBlocksUseCaseParams extends BaseUseCaseParams{}
