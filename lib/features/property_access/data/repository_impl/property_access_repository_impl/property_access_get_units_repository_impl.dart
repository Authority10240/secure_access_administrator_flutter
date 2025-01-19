
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/property_access/data/data_source/remote/property_access_remote_data_source.dart';
import 'package:secure_access_administrator/features/property_access/domain/repository/property_access_repository/property_access_get_units_repository.dart';
import 'package:secure_access_repository/models/secure_access_property_model/secure_access_properties_model.dart';
import 'package:secure_access_repository/models/secure_access_units_model/secure_access_units_model.dart';

@Injectable(as: PropertyAccessGetUnitsRepository)
class PropertyAccessGetUnitsRepositoryImpl extends PropertyAccessGetUnitsRepository {

  final PropertyAccessRemoteDataSource propertyAccessRemoteDataSource;
  PropertyAccessGetUnitsRepositoryImpl({required this.propertyAccessRemoteDataSource});

  @override
  Future<void> call({PropertyAccessGetUnitsRepositoryParams? params,
    required Function(Stream<QuerySnapshot<SecureAccessUnitsModel?>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {
    await safeBackEndCalls(apiRequest: propertyAccessRemoteDataSource.propertiesGetUnits(
        blockId: params!.blockId),
        onSuccess:(model)=> onSuccess!(model),
        onError:(error)=> onError!(error));
  }
  

}
