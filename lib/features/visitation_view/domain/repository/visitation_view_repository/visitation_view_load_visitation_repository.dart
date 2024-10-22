import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_model.dart';

abstract class VisitationViewLoadVisitationRepository  extends BaseRepository<VisitationViewLoadVisitationRepositoryParams, Stream<QuerySnapshot<VisitationViewLoadVisitationModel?>>>{}

class VisitationViewLoadVisitationRepositoryParams extends BaseRepositoryParams{

  VisitationViewLoadVisitationRepositoryParams({required this.date});

  final String date;
}
