import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/constants/database.dart';
import 'package:secure_access_administrator/features/residents/data/data_source/remote/residents_remote_data_source.dart';
import 'package:secure_access_repository/models/secure_access_resident_model/secure_access_resident_model.dart';

@Singleton(as: ResidentRemoteDataSource)
class ResidentsRemoteDataSourceImpl extends ResidentRemoteDataSource{

  late CollectionReference _residentsRef;


  @override
  Future<bool> addResident({required String blockId, required String unitId, required SecureAccessResidentModel secureAccessResidentModel})async {
    try {

      UserCredential user =
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: secureAccessResidentModel.residentEmail!, password: secureAccessResidentModel.residentId!);

      _residentsRef =
          FirebaseFirestore.instance.
          collection(property_blocks).
          doc(blockId).
          collection(property_units).doc(unitId).collection(property_resident)
              .withConverter<
              SecureAccessResidentModel>
            (fromFirestore: (snapShot, _) =>
              SecureAccessResidentModel.fromJson(snapShot.data()!),
              toFirestore: (residents, _) => residents.toJson());

      await _residentsRef.add(secureAccessResidentModel);

      _residentsRef = FirebaseFirestore.instance.collection(property_resident).doc(secureAccessResidentModel.residentEmail).collection(resident_details).
      withConverter<
          SecureAccessResidentModel>(fromFirestore: (snapshot,_)=> SecureAccessResidentModel.fromJson(snapshot.data()!),
          toFirestore: (residents,_) => residents.toJson());
      await _residentsRef.add(secureAccessResidentModel);


      return true;

    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<Stream<QuerySnapshot<SecureAccessResidentModel?>>> getResidents({required String blockId, required String unitId}) async{
    try{
      CollectionReference<SecureAccessResidentModel> _residentsRef =
      FirebaseFirestore.instance
          .collection(property_blocks).doc(blockId)
          .collection(property_units).doc(unitId)
          .collection(property_resident)
          .withConverter<SecureAccessResidentModel>(
          fromFirestore: (snapShot,_)=> SecureAccessResidentModel.fromJson(snapShot.data()!),
          toFirestore:(dashboardPageLoadVisitationsModel, _ )=> dashboardPageLoadVisitationsModel.toJson());

      Stream<QuerySnapshot<SecureAccessResidentModel?>> list = _residentsRef.snapshots();

      return list;
    }catch(ex){
      rethrow;
    }
  }

  String generatePassword({required SecureAccessResidentModel model}){
    return '${model.residentName!.substring(0,2).toUpperCase()}'
        '${model.residentSurname!.substring(0,2).toUpperCase()}'
        '${model.residentPhoneNumber!.substring(0,2).toUpperCase()}'
        '${model.residentId!.substring(0,2).toUpperCase()}'
        '${model.residentEmail!.substring(0,2).toUpperCase()}';
  }
//THMA0896ED for edulink bit
}