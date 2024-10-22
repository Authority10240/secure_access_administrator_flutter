
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_model.dart';
import 'package:secure_access_administrator/features/visitation_view/domain/repository/visitation_view_repository/visitation_view_load_visitation_repository.dart';

@Injectable()
class VisitationViewLoadVisitationUseCase extends BaseUseCase<VisitationViewLoadVisitationUseCaseParams, Stream<QuerySnapshot<VisitationViewLoadVisitationModel>>>{

  final VisitationViewLoadVisitationRepository visitationViewLoadVisitationRepository;

  VisitationViewLoadVisitationUseCase({required this.visitationViewLoadVisitationRepository});

  @override
  Future<void> call({
    required Function(Stream<QuerySnapshot<VisitationViewLoadVisitationModel>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    VisitationViewLoadVisitationUseCaseParams? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class VisitationViewLoadVisitationUseCaseParams extends BaseUseCaseParams{

  VisitationViewLoadVisitationUseCaseParams({required this.date});
  final String date;
}
