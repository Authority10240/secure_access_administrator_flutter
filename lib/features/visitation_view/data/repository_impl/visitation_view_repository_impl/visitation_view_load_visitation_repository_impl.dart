import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/visitation_view/data/data_source/remote/visitation_view_data_source.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_model.dart';
import 'package:secure_access_administrator/features/visitation_view/domain/repository/visitation_view_repository/visitation_view_load_visitation_repository.dart';

@Injectable(as: VisitationViewLoadVisitationRepository)
class VisitataionViewLoadVisitationRepositoryImpl extends VisitationViewLoadVisitationRepository {

  VisitataionViewLoadVisitationRepositoryImpl({required this.visitationViewDataSource});

  final VisitationViewDataSource visitationViewDataSource;

  @override
  Future<void> call({VisitationViewLoadVisitationRepositoryParams? params,
    required Function(Stream<QuerySnapshot<VisitationViewLoadVisitationModel?>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError})async {
    try{
      onSuccess!.call(visitationViewDataSource.visitationViewLoadVisitation(date: params!.date));
    }on Exception catch(ex){
      onError!.call(BaseFailure.factory(ex: ex));
    }
  }
  

}
