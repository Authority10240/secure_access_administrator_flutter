import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/extensions/date_extension.dart';
import 'package:secure_access_administrator/features/vehicle_search/data/data_source/remote/vehicle_search_data_source.dart';
import 'package:secure_access_administrator/features/vehicle_search/presentation/modal/vehicle_search_criteria.dart';
import 'package:secure_access_repository/models/repository_models.dart';

import '../../../../../core/constants/database.dart';

@Singleton(as: VehicleSearchDataSource)
class VehicleSearchDataSourceImpl extends VehicleSearchDataSource{
  @override
  Future<SecureAccessVisitationsModel> visitationSearchLoadVehicle({required String visitationId})async {
    CollectionReference<SecureAccessVisitationsModel> _visitationRef;
    _visitationRef = FirebaseFirestore.instance.collection(visitation_reference)
        .withConverter<SecureAccessVisitationsModel>(
        fromFirestore: (snapShot,_)=> SecureAccessVisitationsModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsModel, _ )=> dashboardPageLoadVisitationsModel.toJson());

    Stream<DocumentSnapshot<SecureAccessVisitationsModel>>  snap = _visitationRef.doc(visitationId).snapshots();
    DocumentSnapshot<SecureAccessVisitationsModel> firstSnap = await snap.first;

    return  firstSnap.data()!;
  }

  @override
  Stream<QuerySnapshot<SecureAccessVisitationsVehicleModel>> visitationSearchValueChanged({required VehicleSearchCriteria visitationSearchCriteria}) {

    DateTime? from;
    String? dateString;

    CollectionReference<SecureAccessVisitationsVehicleModel> _vehicleRef;
    _vehicleRef = FirebaseFirestore.instance.collection(visitation_vehicle_details)
        .withConverter<SecureAccessVisitationsVehicleModel>(
        fromFirestore: (snapShot,_)=> SecureAccessVisitationsVehicleModel.fromJson(snapShot.data()!),
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