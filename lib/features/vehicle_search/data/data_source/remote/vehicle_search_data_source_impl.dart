import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/extensions/date_extension.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access_administrator/features/vehicle_search/data/data_source/remote/vehicle_search_data_source.dart';
import 'package:secure_access_administrator/features/vehicle_search/presentation/modal/vehicle_search_criteria.dart';

import '../../../../../core/constants/database.dart';

@Singleton(as: VehicleSearchDataSource)
class VehicleSearchDataSourceImpl extends VehicleSearchDataSource{
  @override
  Future<DashboardGetVisitationsModel> visitationSearchLoadVehicle({required String visitationId})async {
    CollectionReference<DashboardGetVisitationsModel> _visitationRef;
    _visitationRef = FirebaseFirestore.instance.collection(visitation_reference)
        .withConverter<DashboardGetVisitationsModel>(
        fromFirestore: (snapShot,_)=> DashboardGetVisitationsModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsModel, _ )=> dashboardPageLoadVisitationsModel.toJson());

    Stream<DocumentSnapshot<DashboardGetVisitationsModel>>  snap = _visitationRef.doc(visitationId).snapshots();
    DocumentSnapshot<DashboardGetVisitationsModel> firstSnap = await snap.first;

    return  firstSnap.data()!;
  }

  @override
  Stream<QuerySnapshot<DashboardPageLoadVisitationsVehicleModel>> visitationSearchValueChanged({required VehicleSearchCriteria visitationSearchCriteria}) {

    DateTime? from;
    String? dateString;

    CollectionReference<DashboardPageLoadVisitationsVehicleModel> _vehicleRef;
    _vehicleRef = FirebaseFirestore.instance.collection(visitation_vehicle_details)
        .withConverter<DashboardPageLoadVisitationsVehicleModel>(
        fromFirestore: (snapShot,_)=> DashboardPageLoadVisitationsVehicleModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsModel, _ )=> dashboardPageLoadVisitationsModel.toJson());

    if(visitationSearchCriteria.from!= null){
      from = DateTime(visitationSearchCriteria.from!.year, visitationSearchCriteria.from!.month, visitationSearchCriteria.from!.day);
      dateString = from.toString().toFormattedDate();
    }
    
    return _vehicleRef
    .where('date', isEqualTo: dateString)
    .where('unit', isEqualTo: visitationSearchCriteria.unit)
    .where('licenseNumber', isEqualTo: visitationSearchCriteria.licenseNumber)
    .where('id', isEqualTo: visitationSearchCriteria.idNumber)
    .where('model', isEqualTo: visitationSearchCriteria.model)
        .where('make',isEqualTo:visitationSearchCriteria.make).snapshots();
    

    
  }

}