import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:secure_access_administrator/core/hive_storage.dart';
import 'package:secure_access_administrator/features/login/presentation/login_page.dart';
import 'package:secure_access_administrator/generated/l10n.dart';

import 'app_locals.dart';
import 'locator.dart';

class SecureAccessAdministratorApp{

  static Future<void> appInit() async{
    initializeDateFormatting();
    await initHive();
    setupLocators();
    run();
  }

  static  void run(){
    return runApp(
        const GetMaterialApp(
          localizationsDelegates:  [
            AppLocalizations.delegate,
          ],
          supportedLocales:  AppSupportedLocals.appSupportedLocals,
          home: LoginPage(),
        )
    );
  }
}