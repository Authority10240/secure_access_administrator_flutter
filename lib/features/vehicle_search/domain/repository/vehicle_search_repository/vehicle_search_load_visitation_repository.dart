

import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_repository/models/secure_access_visitation_model/secure_access_visitations_model.dart';

abstract class VehicleSearchLoadVisitationRepository  extends BaseRepository<VehicleSearchLoadVisitationRepositoryParams, SecureAccessVisitationsModel>{}

class VehicleSearchLoadVisitationRepositoryParams extends BaseRepositoryParams{


  VehicleSearchLoadVisitationRepositoryParams({required this.visitationid});

  final String visitationid;
}
