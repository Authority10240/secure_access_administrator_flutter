import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/constants/date.dart';
import 'package:secure_access_administrator/features/dashboard/data/data_source/remote/dashboard_service.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_vistations_model.dart';

String visitation_details_collection = todaysDate;
const String visitation_vehicle_details = "vehicle";

@Singleton(as: DashboardService)
class DashboardServiceImpl extends DashboardService{

  DashboardServiceImpl({required this.firebaseFirestore}){
    _visitationsRef = firebaseFirestore.collection(visitation_details_collection)
        .withConverter<DashboardPageLoadVisitationsModel>(
        fromFirestore: (snapShot,_)=> DashboardPageLoadVisitationsModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsModel, _ )=> dashboardPageLoadVisitationsModel.toJson());


  }


  final FirebaseFirestore firebaseFirestore;
  late  CollectionReference<DashboardPageLoadVisitationsModel> _visitationsRef;

  @override
  Stream<QuerySnapshot<DashboardPageLoadVisitationsModel?>> dashboardPageLoadVisitations() {
    Stream<QuerySnapshot<DashboardPageLoadVisitationsModel?>> list = _visitationsRef.snapshots();
    return  list;
  }

  @override
  Future<DashboardPageLoadVisitationsVehicleModel> dashboardPageLoadVisitationVehicle({required String visitationId})async {
    CollectionReference<DashboardPageLoadVisitationsVehicleModel> _vehicleRef =  FirebaseFirestore.instance.
    collection(visitation_details_collection).
    doc(visitationId).
    collection(visitation_vehicle_details).
    withConverter(
        fromFirestore: (snapShot,_)=> DashboardPageLoadVisitationsVehicleModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsVehicleModel, _ )=> dashboardPageLoadVisitationsVehicleModel.toJson());

    QuerySnapshot<DashboardPageLoadVisitationsVehicleModel> queryVehicle = await _vehicleRef.snapshots().first;
    List<QueryDocumentSnapshot<DashboardPageLoadVisitationsVehicleModel>> queryDocumentVehicle = queryVehicle.docs;

    return queryDocumentVehicle.first.data();
  }

}