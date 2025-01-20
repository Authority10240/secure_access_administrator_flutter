import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access_repository/models/secure_access_resident_model/secure_access_resident_model.dart';

abstract class ResidentRemoteDataSource {

  Future<Stream<QuerySnapshot<SecureAccessResidentModel?>>> getResidents({required String blockId, required String unitId});

  Future<bool> addResident({required String blockId, required String unitId, required SecureAccessResidentModel secureAccessResidentModel});
}