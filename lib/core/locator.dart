import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'locator.config.dart';

GetIt locator = GetIt.instance;

@InjectableInit(
    initializerName: 'init',
    preferRelativeImports: true,
    asExtension: true
)
void setupLocators() => locator.init();

@module
abstract class RegisterModules{

  Dio get dio => Dio();

  AppLocalizations get appLocalizations;

  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  FirebaseFirestore get firebaseFireStore => FirebaseFirestore.instance;
}