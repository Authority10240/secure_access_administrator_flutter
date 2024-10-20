import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secure_access_administrator/core/secure_access_administrator_app.dart';

import 'firebase_options.dart';


FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SecureAccessAdministratorApp.appInit();
}