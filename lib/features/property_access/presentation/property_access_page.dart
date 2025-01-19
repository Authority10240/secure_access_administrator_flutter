

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:secure_access_administrator/core/base_classes/base_page.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';
import 'package:secure_access_administrator/core/colors.dart';
import 'package:secure_access_administrator/core/extensions/num_extension.dart';
import 'package:secure_access_administrator/core/locator.dart';
import 'package:secure_access_administrator/core/text_styles.dart';
import 'package:secure_access_administrator/core/widgets/custom_form_button.dart';
import 'package:secure_access_administrator/core/widgets/custom_text_field.dart';
import 'package:secure_access_administrator/core/widgets/preloader_widget.dart';
import 'package:secure_access_administrator/generated/l10n.dart';
import 'package:secure_access_repository/models/secure_access_property_model/secure_access_properties_model.dart';
import 'package:secure_access_repository/models/secure_access_units_model/secure_access_units_model.dart';

import 'bloc/property_access_bloc.dart';

class PropertyAccessPage extends BasePage {
  const PropertyAccessPage({required this.blockId,super.key});

  final String blockId;

  @override
  _PropertyAccessPageState createState() => _PropertyAccessPageState();
}

class _PropertyAccessPageState extends BasePageState<PropertyAccessPage, PropertyAccessBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(PropertyAccessGetUnitsEvent(blockId: widget.blockId));
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _unitNumberController = TextEditingController();
  final TextEditingController _unitNameController = TextEditingController();

  @override
  PreferredSizeWidget? buildAppbar() {
    return AppBar(
      leading: InkWell(child:  HeroIcon(HeroIcons.chevronLeft, color: AppColorScheme.primary,),
        onTap: ()=> Get.back(),),
      backgroundColor: Colors.white,

    );

  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<PropertyAccessBloc, PropertyAccessPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return   SingleChildScrollView(
             child: Card(

                 child: SizedBox(
                   height: MediaQuery.sizeOf(context).height,
                   width: MediaQuery.sizeOf(context).width,
                   child: Row(children: [
                     Card(
                         elevation: 11,
                         child: SizedBox(
                           width: MediaQuery.sizeOf(context).width /3,
                           child: Padding(
                               padding: const EdgeInsets.all(20),
                               child: Column(children: [
                                 Text(appLocalizations.units,
                                     style: TextStyle(
                                         color: AppColorScheme.primary,
                                         fontSize: 28)),
                                 20.height,
                                 Expanded(
                                     child:
                                     (state.dataState == DataState.loading &&
                                         state is PropertyAccessGetUnitsState)
                                         ? Center(
                                       child: preloaderWidget(),
                                     )
                                         :  Padding(
                                       padding: const EdgeInsets.all(20),
                                       child: Column(
                                         children: [

                                           StreamBuilder<
                                               QuerySnapshot<SecureAccessUnitsModel?>>(
                                               stream: state!.residenceUnits,
                                               builder: (context, snapshot) {
                                                 List<
                                                     QueryDocumentSnapshot<
                                                         SecureAccessUnitsModel?>>?
                                                 data =
                                                     snapshot.data?.docs ??
                                                         [];
                                                 return Expanded(
                                                     child: ListView.builder(
                                                         itemCount: snapshot
                                                             .data
                                                             ?.docs
                                                             .length ??
                                                             0,
                                                         itemBuilder:
                                                             (context,
                                                             index) {
                                                               SecureAccessUnitsModel?
                                                           property =
                                                           snapshot.data
                                                               ?.docs
                                                               .elementAt(
                                                               index)
                                                               .data();
                                                           String? unitId =
                                                               snapshot.data
                                                                   ?.docs
                                                                   .elementAt(
                                                                   index)
                                                                   .id;
                                                           return Card(
                                                             elevation: 11,
                                                             child: Container(
                                                                 child: ListTile(
                                                                     leading: Text(
                                                                       property!.unitNumber?.substring(0,1)??'B',
                                                                       style:
                                                                       textStyleSubHeading(),
                                                                     ),
                                                                     title: Text(
                                                                       property!.unitNumber ?? "",
                                                                       style:
                                                                       textStyleSubHeading(),
                                                                     ),
                                                                     trailing: SizedBox(width: 60,
                                                                       child: Row(
                                                                         children: [
                                                                           InkWell(
                                                                             child:
                                                                             HeroIcon(
                                                                               HeroIcons.xMark,
                                                                               color:
                                                                               AppColorScheme.primary,
                                                                             ),
                                                                             onTap:
                                                                                 () {
                                                                               getBloc().add(PropertyAccessDeleteUnitEvent(blockId: widget.blockId, unitId: unitId!));
                                                                             },
                                                                           ),
                                                                           SizedBox(width: 10,),
                                                                           InkWell(
                                                                             child:
                                                                             HeroIcon(
                                                                               HeroIcons.chevronRight,
                                                                               color:
                                                                               AppColorScheme.primary,
                                                                             ),
                                                                             onTap:
                                                                                 () {},
                                                                           ),
                                                                         ],
                                                                       ),
                                                                     ))),
                                                           );
                                                         }));
                                               })
                                         ],
                                       ),
                                     ))
                               ])),
                         )),
                     Expanded(
                       child: Card(
                           elevation: 11,
                           child: Padding(
                             padding: const EdgeInsets.all(20),

                             child: SizedBox( width: MediaQuery.sizeOf(context).width/2,
                               child: Form(
                                 key: _formKey,
                                 child: Column(

                                   children: [
                                     Text(appLocalizations.addNewUnit,
                                         style: TextStyle(
                                             color: AppColorScheme.primary,
                                             fontSize: 28)),
                                     20.height,
                                     CustomTextField(
                                       controller: _unitNumberController,
                                       labelText: appLocalizations.unit,

                                     ),
                                     20.height,
                                     CustomTextField(
                                       controller: _unitNameController,
                                       labelText: appLocalizations.section,
                                     ),
                                     30.height,
                                     CustomFormButton(
                                         isActive: true,
                                         onPressed: () {
                                           if (_formKey.currentState!.validate()) {
                                            getBloc().add(PropertyAccessAddUnitEvent(
                                                blockId: widget.blockId,
                                                secureAccessUnitsModel: SecureAccessUnitsModel(
                                                    unitNumber: _unitNumberController.text,
                                                    unitNameName: _unitNameController.text,
                                                    unitID:'0' )));
                                           }
                                         },
                                         buttonText: getLocalization().addUnit),
                                   ],
                                 ),
                               ),
                             ),
                           )),
                     ),

                   ]),
                 )));
      }, bloc: getBloc(),
    );
  }


  @override
  PropertyAccessBloc initBloc() {
    return locator<PropertyAccessBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
