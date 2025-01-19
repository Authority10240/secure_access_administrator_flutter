

import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_repository/models/secure_access_block_model/secure_access_blocks_model.dart';


abstract class PropertiesAddBlockClickedRepository  extends BaseRepository<PropertiesAddBlockClickedRepositoryParams, bool>{}

class PropertiesAddBlockClickedRepositoryParams extends BaseRepositoryParams{

  final SecureAccessBlocksModel secureAccessBlocksModel;

  PropertiesAddBlockClickedRepositoryParams({required this.secureAccessBlocksModel});
}
