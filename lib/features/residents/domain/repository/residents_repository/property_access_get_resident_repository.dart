

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_repository/models/secure_access_resident_model/secure_access_resident_model.dart';

abstract class PropertyAccessGetresidentRepository  extends BaseRepository<PropertyAccessGetresidentRepositoryParams, Stream<QuerySnapshot<SecureAccessResidentModel?>>>{}

class PropertyAccessGetresidentRepositoryParams extends BaseRepositoryParams{

  final String blockId;
  final String unitId;

  PropertyAccessGetresidentRepositoryParams({required this.blockId, required this.unitId});
}
