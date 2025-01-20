


import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/residents/domain/repository/residents_repository/property_access_add_resident_repository.dart';
import 'package:secure_access_repository/models/secure_access_resident_model/secure_access_resident_model.dart';

@Injectable()
class PropertyAccessAddResidentUseCase extends BaseUseCase<PropertyAccessAddResidentUseCaseParams, bool>{

  final PropertyAccessAddResidentRepository propertyAccessAddResidentRepository;

  PropertyAccessAddResidentUseCase({required this.propertyAccessAddResidentRepository});

  @override
  Future<void> call({
    required Function(bool? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    PropertyAccessAddResidentUseCaseParams? params}) async{
    await propertyAccessAddResidentRepository.call(
        onSuccess: (model)=> onSuccess!(model),
        onError: (error)=> onError!(error),
    params: PropertyAccessAddResidentRepositoryParams(
        secureAccessResidentModel: params!.secureAccessResidentModel,
        blockId: params!.blockId,
        unitsId: params!.unitsId));
  }
}

class PropertyAccessAddResidentUseCaseParams extends BaseUseCaseParams{

  final String blockId;
  final String unitsId;
  final SecureAccessResidentModel secureAccessResidentModel;


  PropertyAccessAddResidentUseCaseParams({
    required this.secureAccessResidentModel,
    required this.blockId,
    required this.unitsId});
}
