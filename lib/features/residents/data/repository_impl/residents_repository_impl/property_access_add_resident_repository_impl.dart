
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/residents/data/data_source/remote/residents_remote_data_source.dart';
import 'package:secure_access_administrator/features/residents/domain/repository/residents_repository/property_access_add_resident_repository.dart';

@Injectable(as: PropertyAccessAddResidentRepository)
class PropertyAccessAddResidentRepositoryImpl extends PropertyAccessAddResidentRepository {

  PropertyAccessAddResidentRepositoryImpl({required this.residentRemoteDataSource});

  final ResidentRemoteDataSource residentRemoteDataSource;
  @override
  Future<void> call({
    PropertyAccessAddResidentRepositoryParams? params,
    required Function(bool? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {
   await safeBackEndCalls(apiRequest: residentRemoteDataSource.addResident(
       blockId: params!.blockId,
       unitId: params!.unitsId,
       secureAccessResidentModel: params!.secureAccessResidentModel),
       onSuccess: (model)=> onSuccess!(model),
       onError: (error)=> onError!(error));
  }
  

}
