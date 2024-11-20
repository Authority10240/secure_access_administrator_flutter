
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/back_end_calls.dart';
import 'package:secure_access_administrator/core/failures/base_failure.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access_administrator/features/vehicle_search/data/data_source/remote/vehicle_search_data_source.dart';
import 'package:secure_access_administrator/features/vehicle_search/domain/repository/vehicle_search_repository/vehicle_search_value_changed_repository.dart';

@Injectable(as: VehicleSearchValueChangedRepository)
class VehicleSearchValueChangedRepositoryImpl extends VehicleSearchValueChangedRepository {

  VehicleSearchValueChangedRepositoryImpl({required this.vehicleSearchDataSource});

  final VehicleSearchDataSource vehicleSearchDataSource;

  @override
  Future<void> call({VehicleSearchValueChangedRepositoryParams? params,
    required Function(Stream<QuerySnapshot<DashboardPageLoadVisitationsVehicleModel>>? model)? onSuccess,
    required Function(BaseFailure? error)? onError}) async{
    try{
       onSuccess!.call( vehicleSearchDataSource.visitationSearchValueChanged(visitationSearchCriteria: params!.vehicleSearchCriteria));
    }on Exception catch(ex){
      onError!.call(BaseFailure.factory(ex: ex));
    }
  }
  

}
