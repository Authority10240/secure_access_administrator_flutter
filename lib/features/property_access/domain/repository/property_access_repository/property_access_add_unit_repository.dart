

import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_repository/models/secure_access_units_model/secure_access_units_model.dart';

abstract class PropertyAccessAddUnitRepository  extends BaseRepository<PropertyAccessAddUnitRepositoryParams, bool>{}

class PropertyAccessAddUnitRepositoryParams extends BaseRepositoryParams{

  final String blockId;
  final SecureAccessUnitsModel secureAccessUnitsModel;

  PropertyAccessAddUnitRepositoryParams({required this.secureAccessUnitsModel, required this.blockId});
}
