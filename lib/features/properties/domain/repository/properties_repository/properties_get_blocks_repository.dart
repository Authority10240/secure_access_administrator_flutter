

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_repository/models/secure_access_block_model/secure_access_blocks_model.dart';

abstract class PropertiesGetBlocksRepository  extends BaseRepository<PropertiesGetBlocksRepositoryParams, Stream<QuerySnapshot<SecureAccessBlocksModel?>>>{}

class PropertiesGetBlocksRepositoryParams extends BaseRepositoryParams{}
