
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/visitation_search/data/data_source/remote/visitation_search_remote_data_source.dart';
import 'package:secure_access_administrator/features/visitation_search/domain/repository/visitation_search_repository/visitation_search_value_changed_repository.dart';
import 'package:secure_access_repository/models/repository_models.dart';

@Injectable(as: VisitationSearchValueChangedRepository)
class VisitationSearchValueChangedRepositoryImpl extends VisitationSearchValueChangedRepository {

  VisitationSearchValueChangedRepositoryImpl({required this.visitationSearchRemoteDataSource});

  final VisitationSearchRemoteDataSource visitationSearchRemoteDataSource;

  @override
  Future<void> call({VisitationSearchValueChangedRepositoryParams? params, required Function(Stream<QuerySnapshot<SecureAccessVisitationsModel?>>? model)? onSuccess, required Function(BaseFailure? error)? onError})async {
    try{
      onSuccess!.call(visitationSearchRemoteDataSource.visitationSearchValueChanged(
          visitationSearchCriteria: params!.visitationSearchCriteria));
    }on Exception catch(ex){
      onError!.call(BaseFailure.factory(ex: ex));
    }
  }
  

}
