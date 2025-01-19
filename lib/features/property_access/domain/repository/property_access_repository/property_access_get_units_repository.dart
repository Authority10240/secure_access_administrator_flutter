
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_repository/models/secure_access_property_model/secure_access_properties_model.dart';
import 'package:secure_access_repository/models/secure_access_units_model/secure_access_units_model.dart';

abstract class PropertyAccessGetUnitsRepository  extends BaseRepository<PropertyAccessGetUnitsRepositoryParams, Stream<QuerySnapshot<SecureAccessUnitsModel?>>>{}

class PropertyAccessGetUnitsRepositoryParams extends BaseRepositoryParams{

  final String blockId;


  PropertyAccessGetUnitsRepositoryParams({required this.blockId});
}
