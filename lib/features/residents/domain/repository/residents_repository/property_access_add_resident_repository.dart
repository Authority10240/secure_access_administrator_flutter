

import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_repository/models/secure_access_resident_model/secure_access_resident_model.dart';

abstract class PropertyAccessAddResidentRepository  extends BaseRepository<PropertyAccessAddResidentRepositoryParams, bool>{}

class PropertyAccessAddResidentRepositoryParams extends BaseRepositoryParams{

  final String blockId;
  final String unitsId;
  final SecureAccessResidentModel secureAccessResidentModel;


  PropertyAccessAddResidentRepositoryParams({
    required this.secureAccessResidentModel,
    required this.blockId,
    required this.unitsId});
}
