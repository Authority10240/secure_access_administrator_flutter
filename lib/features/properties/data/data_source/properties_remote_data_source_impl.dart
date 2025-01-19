import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/constants/database.dart';
import 'package:secure_access_administrator/features/properties/data/data_source/properties_remote_data_source.dart';
import 'package:secure_access_repository/models/secure_access_block_model/secure_access_blocks_model.dart';

@Singleton(as: PropertiesRemoteDataSource)
class PropertiesRemoteDataSourceImpl extends PropertiesRemoteDataSource{

  PropertiesRemoteDataSourceImpl();


  late CollectionReference _propertiesRef;

  @override
  Future<bool> propertiesAddBlockButtonClicked({required SecureAccessBlocksModel model})async {
    try {
      _propertiesRef =
          FirebaseFirestore.instance.collection(property_blocks).withConverter<
              SecureAccessBlocksModel>
            (fromFirestore: (snapShot, _) =>
              SecureAccessBlocksModel.fromJson(snapShot.data()!),
              toFirestore: (blocks, _) => blocks.toJson());

       await _propertiesRef.add(model);
    }catch(ex){
      rethrow;
    }
    return true;
  }

  @override
  Future<Stream<QuerySnapshot<SecureAccessBlocksModel?>>> propertiesGetBlocks()async {
    try{
      CollectionReference<SecureAccessBlocksModel> _blocksRef = FirebaseFirestore.instance.collection(property_blocks)
          .withConverter<SecureAccessBlocksModel>(
          fromFirestore: (snapShot,_)=> SecureAccessBlocksModel.fromJson(snapShot.data()!),
          toFirestore:(dashboardPageLoadVisitationsModel, _ )=> dashboardPageLoadVisitationsModel.toJson());

      Stream<QuerySnapshot<SecureAccessBlocksModel>> list = _blocksRef.snapshots();

      return list;
    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<bool> propertiesDeleteBlock({required String blockId})async {
  try{

         FirebaseFirestore.instance.collection(property_blocks).doc(blockId).delete();

   return true;
  }catch(ex){
    rethrow;
  }
  }
  
}