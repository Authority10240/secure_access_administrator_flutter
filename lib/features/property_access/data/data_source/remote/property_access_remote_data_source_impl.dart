import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/constants/database.dart';
import 'package:secure_access_administrator/features/property_access/data/data_source/remote/property_access_remote_data_source.dart';
import 'package:secure_access_repository/models/secure_access_property_model/secure_access_properties_model.dart';
import 'package:secure_access_repository/models/secure_access_units_model/secure_access_units_model.dart';

@Singleton(as: PropertyAccessRemoteDataSource )
class PropertyAccessRemoteDataSourceImpl extends PropertyAccessRemoteDataSource{

  late CollectionReference _unitsRef;

  @override
  Future<bool> propertiesAddUnitButtonClicked({required String blockId, required SecureAccessUnitsModel model}) async{
    try {
      _unitsRef =
          FirebaseFirestore.instance.
          collection(property_blocks).
          doc(blockId).
          collection(property_blocks)
              .withConverter<
              SecureAccessPropertiesModel>
            (fromFirestore: (snapShot, _) =>
              SecureAccessPropertiesModel.fromJson(snapShot.data()!),
              toFirestore: (blocks, _) => blocks.toJson());

      await _unitsRef.add(model);
      return true;
    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<bool> propertiesDeleteUnit({required String blockId, unitId})async {
    try{

      FirebaseFirestore.instance.collection(property_blocks).doc(blockId).collection(property_units).doc(unitId).delete();

      return true;
    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<Stream<QuerySnapshot<SecureAccessUnitsModel?>>> propertiesGetUnits({required String blockId}) async{
    try{
      CollectionReference<SecureAccessUnitsModel> _unitsRef =
      FirebaseFirestore.instance.collection(property_blocks).doc().collection(property_units)
          .withConverter<SecureAccessUnitsModel>(
          fromFirestore: (snapShot,_)=> SecureAccessUnitsModel.fromJson(snapShot.data()!),
          toFirestore:(dashboardPageLoadVisitationsModel, _ )=> dashboardPageLoadVisitationsModel.toJson());

      Stream<QuerySnapshot<SecureAccessUnitsModel>> list = _unitsRef.snapshots();

      return list;
    }catch(ex){
      rethrow;
    }
  }


}