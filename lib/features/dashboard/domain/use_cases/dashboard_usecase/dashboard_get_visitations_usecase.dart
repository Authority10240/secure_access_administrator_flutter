import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/core/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/domain/repository/dashboard_repository/dashboard_get_visitations_repository.dart';

@Injectable()
class DashboardGetVisitationsUseCase extends BaseUseCase<DashboardGetVisitationsUseCaseParams, Stream<QuerySnapshot<DashboardGetVisitationsModel>>>{

  final DashboardGetVisitationsRepository dashboardGetVisitationsRepository;

  DashboardGetVisitationsUseCase({required this.dashboardGetVisitationsRepository});

  @override
  Future<void> call({
    required Function(Stream<QuerySnapshot<DashboardGetVisitationsModel>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError,
    DashboardGetVisitationsUseCaseParams? params}) async{
   await dashboardGetVisitationsRepository.call(
       onSuccess: (model)=> onSuccess!(model!),
       onError: (error)=> onError!(error),
   params: DashboardGetVisitationsRepositoryParams(date: params!.date));
  }
}

class DashboardGetVisitationsUseCaseParams extends BaseUseCaseParams{
  DashboardGetVisitationsUseCaseParams({required this.date});
  final String date;
}
