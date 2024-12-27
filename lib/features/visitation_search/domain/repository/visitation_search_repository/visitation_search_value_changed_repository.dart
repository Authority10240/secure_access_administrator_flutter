

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/core/base_classes/base_repository.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/modal/visitation_search_criteria.dart';
import 'package:secure_access_repository/models/repository_models.dart';

abstract class VisitationSearchValueChangedRepository  extends BaseRepository<VisitationSearchValueChangedRepositoryParams, Stream<QuerySnapshot<SecureAccessVisitationsModel?>>>{}

class VisitationSearchValueChangedRepositoryParams extends BaseRepositoryParams{

  VisitationSearchValueChangedRepositoryParams({required this.visitationSearchCriteria});

  final VisitationSearchCriteria visitationSearchCriteria;
}
