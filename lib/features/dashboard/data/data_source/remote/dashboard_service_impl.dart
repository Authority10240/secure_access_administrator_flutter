import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/constants/database.dart';
import 'package:secure_access_administrator/features/dashboard/data/data_source/remote/dashboard_service.dart';
import 'package:secure_access_repository/models/repository_models.dart';
import 'package:secure_access_repository/models/secure_access_visitations_vehicle_model/secure_access_visitations_vehicle_model.dart';


@Injectable(as: DashboardService)
class DashboardServiceImpl extends DashboardService{

  DashboardServiceImpl(){}




  @override
  Stream<QuerySnapshot<SecureAccessVisitationsModel>> dashboardGetVisitations({required String date}) {

    CollectionReference<SecureAccessVisitationsModel> _visitationsRef; _visitationsRef = FirebaseFirestore.instance.collection(visitation_reference)
        .withConverter<SecureAccessVisitationsModel>(
        fromFirestore: (snapShot,_)=> SecureAccessVisitationsModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsModel, _ )=> dashboardPageLoadVisitationsModel.toJson());

    Stream<QuerySnapshot<SecureAccessVisitationsModel>> list = _visitationsRef.where('date',isEqualTo: date).snapshots();
    return  list;
  }

  @override
  Future<SecureAccessVisitationsVehicleModel> dashboardPageLoadVisitationVehicle({required String visitationId, required String date})async {
    CollectionReference<SecureAccessVisitationsVehicleModel> _vehicleRef =  FirebaseFirestore.instance.
    collection(visitation_vehicle_details).
    withConverter(
        fromFirestore: (snapShot,_)=> SecureAccessVisitationsVehicleModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsVehicleModel, _ )=> dashboardPageLoadVisitationsVehicleModel.toJson());

    QuerySnapshot<SecureAccessVisitationsVehicleModel> queryVehicle = await _vehicleRef.
    where('identificationNumber',isEqualTo: visitationId).
    where('date', isEqualTo: date).snapshots().first;
    List<QueryDocumentSnapshot<SecureAccessVisitationsVehicleModel>> queryDocumentVehicle = queryVehicle.docs;

    return queryDocumentVehicle.first.data();
  }



}