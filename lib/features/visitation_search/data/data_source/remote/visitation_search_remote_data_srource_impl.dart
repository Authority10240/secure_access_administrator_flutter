import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/constants/database.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/visitation_search/data/data_source/remote/visitation_search_remote_data_source.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/modal/visitation_search_criteria.dart';

@Singleton(as: VisitationSearchRemoteDataSource)
class VisitationSearchRemotedataSourceImple extends VisitationSearchRemoteDataSource{
  @override
  Stream<QuerySnapshot<DashboardGetVisitationsModel?>> visitationSearchValueChanged({required VisitationSearchCriteria visitationSearchCriteria}) {
    CollectionReference<DashboardGetVisitationsModel> _visitationsRef; _visitationsRef = FirebaseFirestore.instance.collection(visitation_reference)
        .withConverter<DashboardGetVisitationsModel>(
        fromFirestore: (snapShot,_)=> DashboardGetVisitationsModel.fromJson(snapShot.data()!),
        toFirestore:(dashboardPageLoadVisitationsModel, _ )=> dashboardPageLoadVisitationsModel.toJson());
    
    if(visitationSearchCriteria.idPassport != null && visitationSearchCriteria.idPassport!.isNotEmpty){
      _visitationsRef.where('identificationNumber',arrayContains: visitationSearchCriteria.idPassport!);
    }
    if(visitationSearchCriteria.to!= null ){
      _visitationsRef.where('to',isLessThanOrEqualTo: visitationSearchCriteria.to!);
    }
    if(visitationSearchCriteria.from!= null  ){
      _visitationsRef.where('from',isGreaterThanOrEqualTo: visitationSearchCriteria.from!!);
    }
    if(visitationSearchCriteria.name!= null  && visitationSearchCriteria.name!.isNotEmpty){
      _visitationsRef.where('firstName',arrayContains: visitationSearchCriteria.name!);
    }
    if(visitationSearchCriteria.surname!= null  && visitationSearchCriteria.surname!.isNotEmpty){
      _visitationsRef.where('lastName',arrayContains: visitationSearchCriteria.surname!);
    }
    if(visitationSearchCriteria.unit!= null  && visitationSearchCriteria.unit!.isNotEmpty){
      _visitationsRef.where('unit',arrayContains: visitationSearchCriteria.unit!);
    }



    Stream<QuerySnapshot<DashboardGetVisitationsModel?>> list = _visitationsRef.orderBy('date').snapshots();
    return  list;
  }

}