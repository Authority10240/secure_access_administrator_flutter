
import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_repository/models/repository_models.dart';

abstract class VisitationSearchLoadVehicleRepository  extends BaseRepository<VisitationSearchLoadVehicleRepositoryParams, SecureAccessVisitationsVehicleModel>{}

class VisitationSearchLoadVehicleRepositoryParams extends BaseRepositoryParams{
  VisitationSearchLoadVehicleRepositoryParams({required this.date, required this.visitationId});

  final String visitationId;
  final String date;
}
