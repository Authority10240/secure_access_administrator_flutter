
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/visitation_search/domain/repository/visitation_search_repository/visitation_search_value_changed_repository.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/modal/visitation_search_criteria.dart';
import 'package:secure_access_repository/models/repository_models.dart';

@Injectable()
class VisitationSearchValueChangedUseCase extends BaseUseCase<VisitationSearchValueChangedUseCaseParams,  Stream<QuerySnapshot<SecureAccessVisitationsModel?>>>{

  final VisitationSearchValueChangedRepository visitationSearchValueChangedRepository;

  VisitationSearchValueChangedUseCase({required this.visitationSearchValueChangedRepository});

  @override
  Future<void> call({
    required Function(Stream<QuerySnapshot<SecureAccessVisitationsModel?>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    VisitationSearchValueChangedUseCaseParams? params}) async{
    await visitationSearchValueChangedRepository.call(
        onSuccess: (stream){
          onSuccess!.call(stream);
    }, onError: (error){
      onError!.call(error);
    },
    params: VisitationSearchValueChangedRepositoryParams(visitationSearchCriteria: params!.visitationSearchCriteria));
  }
}

class VisitationSearchValueChangedUseCaseParams extends BaseUseCaseParams{
VisitationSearchValueChangedUseCaseParams({required this.visitationSearchCriteria});

  final VisitationSearchCriteria visitationSearchCriteria;
}
