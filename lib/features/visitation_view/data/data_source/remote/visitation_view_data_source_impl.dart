import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/constants/database.dart';
import 'package:secure_access_administrator/features/visitation_view/data/data_source/remote/visitation_view_data_source.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_model.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_vehicle_model.dart';

@Injectable(as: VisitationViewDataSource)

class VisitationViewDataSourceImpl extends VisitationViewDataSource{
  @override
  Stream<QuerySnapshot<VisitationViewLoadVisitationModel?>> visitationViewLoadVisitation({required String date}) {
      CollectionReference<VisitationViewLoadVisitationModel> _visitationsRef;_visitationsRef = FirebaseFirestore.instance.collection(visitation_reference)
        .withConverter<VisitationViewLoadVisitationModel>(
        fromFirestore: (snapShot,_)=> VisitationViewLoadVisitationModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsModel, _ )=> dashboardPageLoadVisitationsModel.toJson());

      Stream<QuerySnapshot<VisitationViewLoadVisitationModel?>> list = _visitationsRef.where('date' ,isEqualTo: date  ).snapshots();
      return  list;
  }

  @override
  Future<VisitationViewLoadVisitationVehicleModel> visitationViewLoadVisitationVehicle({required String visitationId, required String date}) async {
    CollectionReference<VisitationViewLoadVisitationVehicleModel> _vehicleRef =  FirebaseFirestore.instance.
    collection(visitation_vehicle_details).
    withConverter(
        fromFirestore: (snapShot,_)=> VisitationViewLoadVisitationVehicleModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsVehicleModel, _ )=> dashboardPageLoadVisitationsVehicleModel.toJson());

    QuerySnapshot<VisitationViewLoadVisitationVehicleModel> queryVehicle = await _vehicleRef.
    where('id',isEqualTo: visitationId).
    where('date', isEqualTo: date).snapshots().first;
    List<QueryDocumentSnapshot<VisitationViewLoadVisitationVehicleModel>> queryDocumentVehicle = queryVehicle.docs;

    return queryDocumentVehicle.first.data();
  }

}