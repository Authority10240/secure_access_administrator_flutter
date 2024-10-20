import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/constants/database.dart';
import 'package:secure_access_administrator/features/dashboard/data/data_source/remote/dashboard_service.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';


@Injectable(as: DashboardService)
class DashboardServiceImpl extends DashboardService{

  DashboardServiceImpl(){}




  @override
  Stream<QuerySnapshot<DashboardGetVisitationsModel>> dashboardGetVisitations({required String date}) {

    CollectionReference<DashboardGetVisitationsModel> _visitationsRef; _visitationsRef = FirebaseFirestore.instance.collection(visitation_reference)
        .withConverter<DashboardGetVisitationsModel>(
        fromFirestore: (snapShot,_)=> DashboardGetVisitationsModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsModel, _ )=> dashboardPageLoadVisitationsModel.toJson());

    Stream<QuerySnapshot<DashboardGetVisitationsModel>> list = _visitationsRef.where('date',isEqualTo: date).snapshots();
    return  list;
  }

  @override
  Future<DashboardPageLoadVisitationsVehicleModel> dashboardPageLoadVisitationVehicle({required String visitationId, required String date})async {
    CollectionReference<DashboardPageLoadVisitationsVehicleModel> _vehicleRef =  FirebaseFirestore.instance.
    collection(visitation_vehicle_details).
    withConverter(
        fromFirestore: (snapShot,_)=> DashboardPageLoadVisitationsVehicleModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsVehicleModel, _ )=> dashboardPageLoadVisitationsVehicleModel.toJson());

    QuerySnapshot<DashboardPageLoadVisitationsVehicleModel> queryVehicle = await _vehicleRef.
    where('identificationNumber',isEqualTo: visitationId).
    where('date', isEqualTo: date).snapshots().first;
    List<QueryDocumentSnapshot<DashboardPageLoadVisitationsVehicleModel>> queryDocumentVehicle = queryVehicle.docs;

    return queryDocumentVehicle.first.data();
  }



}