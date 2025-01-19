import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_repository/models/secure_access_block_model/secure_access_blocks_model.dart';

abstract class PropertiesRemoteDataSource{

  Future<bool> propertiesAddBlockButtonClicked({required SecureAccessBlocksModel model});

  Future<Stream<QuerySnapshot<SecureAccessBlocksModel?>>> propertiesGetBlocks();

  Future<bool> propertiesDeleteBlock({required String blockId});
}

