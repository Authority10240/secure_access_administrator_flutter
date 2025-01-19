
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/properties/data/data_source/properties_remote_data_source.dart';
import 'package:secure_access_administrator/features/properties/domain/repository/properties_repository/properties_delete_block_repository.dart';

@Injectable(as: PropertiesDeleteBlockRepository)
class PropertiesDeleteBlockRepositoryImpl extends PropertiesDeleteBlockRepository {

  PropertiesDeleteBlockRepositoryImpl({required this.propertiesRemoteDataSource});

  final PropertiesRemoteDataSource propertiesRemoteDataSource;
  @override
  Future<void> call({
    PropertiesDeleteBlockRepositoryParams? params, 
    required Function(bool? model)? onSuccess, 
    required Function(BaseFailure? error)? onError}) async{
    await safeBackEndCalls(apiRequest: propertiesRemoteDataSource.propertiesDeleteBlock(blockId: params!.blockId), onSuccess: onSuccess, onError: onError);
  }
  

}
