

import 'package:secure_access_administrator/core/base_classes/base_repository.dart';

abstract class PropertiesDeleteBlockRepository  extends BaseRepository<PropertiesDeleteBlockRepositoryParams, bool>{}

class PropertiesDeleteBlockRepositoryParams extends BaseRepositoryParams{

  PropertiesDeleteBlockRepositoryParams({required this.blockId});

  final String blockId;
}
