


import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/properties/data/data_source/properties_remote_data_source.dart';
import 'package:secure_access_administrator/features/properties/domain/repository/properties_repository/properties_add_block_clicked_repository.dart';

@Injectable(as: PropertiesAddBlockClickedRepository)
class PropertiesAddBlockClickedRepositoryImpl extends PropertiesAddBlockClickedRepository {

  PropertiesAddBlockClickedRepositoryImpl({required this.propertiesRemoteDataSource });
  
  final PropertiesRemoteDataSource propertiesRemoteDataSource;

  @override
  Future<void> call({
    PropertiesAddBlockClickedRepositoryParams? params,
    required Function(bool? model)? onSuccess,
    required Function(BaseFailure? error)? onError}) async {
    safeBackEndCalls(
        apiRequest: propertiesRemoteDataSource.propertiesAddBlockButtonClicked(model: params!.secureAccessBlocksModel),
        onSuccess: (model)=> onSuccess!(model),
        onError: (error)=> onError!(error));
  }
  

}
