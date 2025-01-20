
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/residents/data/data_source/remote/residents_remote_data_source.dart';
import 'package:secure_access_administrator/features/residents/domain/repository/residents_repository/property_access_get_resident_repository.dart';
import 'package:secure_access_repository/models/secure_access_resident_model/secure_access_resident_model.dart';

@Injectable(as: PropertyAccessGetresidentRepository)
class PropertyAccessGetresidentRepositoryImpl extends PropertyAccessGetresidentRepository {

  PropertyAccessGetresidentRepositoryImpl({required this.residentRemoteDataSource});

  final ResidentRemoteDataSource residentRemoteDataSource;

  @override
  Future<void> call({
    PropertyAccessGetresidentRepositoryParams? params,
    required Function(Stream<QuerySnapshot<SecureAccessResidentModel?>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError}) async {
    await safeBackEndCalls(apiRequest: residentRemoteDataSource.getResidents(
        blockId: params!.blockId,
        unitId: params!.blockId),
        onSuccess: (model)=> onSuccess!(model),
        onError: (error)=> onError!(error));
  }
  

}
