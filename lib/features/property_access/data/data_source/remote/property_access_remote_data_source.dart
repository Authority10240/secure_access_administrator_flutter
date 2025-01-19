import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_repository/models/secure_access_property_model/secure_access_properties_model.dart';
import 'package:secure_access_repository/models/secure_access_units_model/secure_access_units_model.dart';

abstract class PropertyAccessRemoteDataSource{

  Future<bool> propertiesAddUnitButtonClicked({required String blockId,required SecureAccessPropertiesModel model});

  Future<Stream<QuerySnapshot<SecureAccessUnitsModel?>>> propertiesGetUnits({required String blockId});

  Future<bool> propertiesDeleteUnit({required String blockId, unitId});
}