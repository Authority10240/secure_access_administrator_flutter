import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/constants/database.dart';
import 'package:secure_access_administrator/core/extensions/date_extension.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access_administrator/features/visitation_search/data/data_source/remote/visitation_search_remote_data_source.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/modal/visitation_search_criteria.dart';

@Singleton(as: VisitationSearchRemoteDataSource)
class VisitationSearchRemotedataSourceImple extends VisitationSearchRemoteDataSource{
  @override
  Stream<QuerySnapshot<DashboardGetVisitationsModel?>> visitationSearchValueChanged({required VisitationSearchCriteria visitationSearchCriteria}) {
    CollectionReference<DashboardGetVisitationsModel> _visitationsRef;
    _visitationsRef = FirebaseFirestore.instance.collection(visitation_reference)
        .withConverter<DashboardGetVisitationsModel>(
        fromFirestore: (snapShot,_)=> DashboardGetVisitationsModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsModel, _ )=> dashboardPageLoadVisitationsModel.toJson());

DateTime? from;
DateTime? to;

String? dateString;

if(visitationSearchCriteria.from!= null){
  from = DateTime(visitationSearchCriteria.from!.year, visitationSearchCriteria.from!.month, visitationSearchCriteria.from!.day);
  dateString = from.toString().toFormattedDate();
}

    if(visitationSearchCriteria.to != null)
       to = DateTime(visitationSearchCriteria.to!.year, visitationSearchCriteria.to!.month, visitationSearchCriteria.to!.day);

    Stream<QuerySnapshot<DashboardGetVisitationsModel?>> list = _visitationsRef
        .where('firstName',isEqualTo: visitationSearchCriteria.name)
        .where('lastName',isEqualTo: visitationSearchCriteria.surname)
        .where('unit', isEqualTo: visitationSearchCriteria.unit)
        .where('identificationNumber',isEqualTo: visitationSearchCriteria.idPassport)
        .where('timeStamp', isLessThanOrEqualTo:to != null? Timestamp.fromDate(to ): null)
        .where('date', isEqualTo:dateString).snapshots();
    return  list;
  }

  @override
  Future<DashboardPageLoadVisitationsVehicleModel> visitationSearchLoadVehicle({required String visitationId, required String date})async {
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