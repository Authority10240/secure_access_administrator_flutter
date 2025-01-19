
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/properties/data/data_source/properties_remote_data_source.dart';
import 'package:secure_access_administrator/features/properties/domain/repository/properties_repository/properties_get_blocks_repository.dart';
import 'package:secure_access_repository/models/secure_access_block_model/secure_access_blocks_model.dart';

@Injectable(as: PropertiesGetBlocksRepository)
class PropertiesGetBlocksRepositoryImpl extends PropertiesGetBlocksRepository {

  PropertiesGetBlocksRepositoryImpl({required this.propertiesRemoteDataSource});

  final PropertiesRemoteDataSource propertiesRemoteDataSource;

  @override
  Future<void> call({
    PropertiesGetBlocksRepositoryParams? params,
    required Function(Stream<QuerySnapshot<SecureAccessBlocksModel?>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {
   await safeBackEndCalls(
       apiRequest: propertiesRemoteDataSource.propertiesGetBlocks(),
       onSuccess: (model)=> onSuccess!(model),
       onError: (error)=> (error));
  }
  

}
