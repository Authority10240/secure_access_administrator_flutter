import 'package:flutter/material.dart';
import 'package:secure_access_administrator/core/sizes.dart';
import 'package:secure_access_administrator/core/text_styles.dart';
import 'package:secure_access_administrator/core/widgets/custom_form_button.dart';
import 'package:get/get.dart';
import 'package:secure_access_administrator/generated/l10n.dart';
import 'package:secure_access_repository/models/repository_models.dart';
void vehicleDescriptionDialog({
  required SecureAccessVisitationsVehicleModel vehicle,
  required SecureAccessVisitationsModel visitation,
  required AppLocalizations appLocalizations}){

  Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: Card(elevation: 11,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      smallSpacer,
                      Center(child: Text('${appLocalizations.the} ${vehicle?.make} ${vehicle?.model} \n ', style: textStyleTitle(),)),
                      smallSpacer,
                      Center(child: Text(appLocalizations.wasDrivenBy, style: textStyleDirectives(),)),
                      mediumSpacer,
                      Text(appLocalizations.name, style:  textStyleDirectives(),),
                      labelSpacer,
                      Text(visitation?.firstName??'', style:  textStyleDescription(),),
                      smallMediumSpacer,
                      Text(appLocalizations.surname, style:  textStyleDirectives(),),
                      labelSpacer,
                      Text(visitation?.lastName??'', style:  textStyleDescription(),),

                      smallMediumSpacer,
                      Text(appLocalizations.license, style:  textStyleDirectives(),),
                      labelSpacer,
                      Text(vehicle?.licenseNumber??''!, style:  textStyleDescription(),),

                      smallMediumSpacer,
                      Text(appLocalizations.id, style:  textStyleDirectives(),),
                      labelSpacer,
                      Text(visitation.identificationsNumber??'', style:  textStyleDescription(),),

                      smallMediumSpacer,
                      Text(appLocalizations.mobileNumber, style:  textStyleDirectives(),),
                      labelSpacer,
                      Text(visitation?.mobileNumber??'', style:  textStyleDescription(),),

                      largeSpacer,
                      CustomFormButton(
                          isActive: true,
                          onPressed: ()=> Get.back(),
                          buttonText: appLocalizations.back),

                    ]
                ),
              ),
            )),
      )
  );
}