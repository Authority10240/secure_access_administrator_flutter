import 'package:hive_flutter/hive_flutter.dart';
import 'package:secure_access_administrator/features/login/data/data_source/local/hive/biometrics_local_storage/model/biometrics_local_model.dart';
import 'package:secure_access_administrator/features/login/data/data_source/local/hive/sign_in_local_storage/sign_in_local_model.dart';

initHive() async{

  registerAdapters();

  await Hive.initFlutter();
  await openBoxes();
}

registerAdapters() {
  Hive.registerAdapter(BiometricsLocalModelAdapter());
  Hive.registerAdapter(SignInLocalModelAdapter());
}

openBoxes() async {
  boxBiometrics = await Hive.openBox(biometricsBox);
  boxSignIn = await Hive.openBox(signInBox);

}

late Box boxBiometrics;
late Box boxSignIn;

const String current = "current";

const String biometricsBox = "BiometricsBox";
const String signInBox = "signInBox";