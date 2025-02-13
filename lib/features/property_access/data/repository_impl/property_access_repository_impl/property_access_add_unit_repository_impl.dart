
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/property_access/data/data_source/remote/property_access_remote_data_source.dart';
import 'package:secure_access_administrator/features/property_access/domain/repository/property_access_repository/property_access_add_unit_repository.dart';

@Injectable(as: PropertyAccessAddUnitRepository)
class PropertyAccessAddUnitRepositoryImpl extends PropertyAccessAddUnitRepository {

  PropertyAccessAddUnitRepositoryImpl({required this.propertyAccessRemoteDataSource});

  final PropertyAccessRemoteDataSource propertyAccessRemoteDataSource;

  @override
  Future<void> call({
    PropertyAccessAddUnitRepositoryParams? params,
    required Function(bool? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {
    await safeBackEndCalls(apiRequest: propertyAccessRemoteDataSource.propertiesAddUnitButtonClicked(
        blockId: params!.blockId, model: params!.secureAccessUnitsModel),
        onSuccess: (model)=> onSuccess!(model),
        onError: (error)=> onError!(error));
  }
  

}
