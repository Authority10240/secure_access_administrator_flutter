

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:secure_access_repository/models/secure_access_resident_model/secure_access_resident_model.dart';

import 'bloc/residents_bloc.dart';


class ResidentsPage extends BasePage {
  const ResidentsPage({super.key, required this.blockId, required this.unitId});

  final String unitId;
  final String blockId;

  @override
  _ResidentsPageState createState() => _ResidentsPageState();
}

class _ResidentsPageState extends BasePageState<ResidentsPage, ResidentsBloc> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(PropertyAccessGetResidentsEvent(unitId: widget.unitId, blockId: widget.blockId));

  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _residentNameController = TextEditingController();
  final TextEditingController _residentSurnameController = TextEditingController();
  final TextEditingController _residentIdController = TextEditingController();
  final TextEditingController _residentEmailController = TextEditingController();
  final TextEditingController _residentPhoneNumberController = TextEditingController();
  final TextEditingController _residentTypeController = TextEditingController();

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<ResidentsBloc, ResidentsPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return SingleChildScrollView(
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
                                 Text(appLocalizations.residents,
                                     style: TextStyle(
                                         color: AppColorScheme.primary,
                                         fontSize: 28)),
                                 20.height,
                                 Expanded(
                                     child:
                                     (state.dataState == DataState.loading &&
                                         state is PropertyAccessGetResidentsState)
                                         ? Center(
                                       child: preloaderWidget(),
                                     )
                                         :  Padding(
                                       padding: const EdgeInsets.all(20),
                                       child: Column(
                                         children: [
                                           StreamBuilder<
                                               QuerySnapshot<SecureAccessResidentModel?>>(
                                               stream: state!.residenceResidents,
                                               builder: (context, snapshot) {
                                                 List<
                                                     QueryDocumentSnapshot<
                                                         SecureAccessResidentModel?>>?
                                                 data = snapshot.data?.docs ??
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
                                                               SecureAccessResidentModel? residents =
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
                                                             child: ListTile(
                                                                 leading: Text(
                                                                  '${residents!.residentName?.substring(0,1)??'$index'} '
                                                                      '${residents!.residentSurname?.substring(0,1)??''}' ,
                                                                   style:
                                                                   textStyleSubHeading(),
                                                                 ),
                                                                 title: Text(
                                                                   '${residents!.residentName??""}'
                                                                       ' ${residents!.residentSurname??"" }',
                                                                   style:
                                                                   textStyleSubHeading(),
                                                                 ),
                                                                 subtitle: Text(
                                                                   '${appLocalizations.emailAddress}:${residents!.residentEmail??""} '
                                                                       '${appLocalizations.residentPhoneNumber}:${residents!.residentSurname??"" }',
                                                                   style:
                                                                   textStyleSubHeading(),
                                                                 ),
                                                                 trailing: SizedBox(width: 60,
                                                                   child: Row(
                                                                     children: [
                                                                       const SizedBox(width: 10,),
                                                                       InkWell(
                                                                         child:
                                                                         HeroIcon(
                                                                           HeroIcons.chevronRight,
                                                                           color:
                                                                           AppColorScheme.primary,
                                                                         ),
                                                                         onTap:
                                                                             () {


                                                                             },
                                                                       ),
                                                                     ],
                                                                   ),
                                                                 ),
                                                             onTap: (){

                                                             },),
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
                                     Text(appLocalizations.addNewResident,
                                         style: TextStyle(
                                             color: AppColorScheme.primary,
                                             fontSize: 28)),
                                     20.height,
                                     CustomTextField(
                                       controller: _residentNameController,
                                       labelText: appLocalizations.residentName,
                                     ),
                                     20.height,
                                     CustomTextField(
                                       controller: _residentSurnameController,
                                       labelText: appLocalizations.residentSurname,
                                     ),
                                     20.height,
                                     CustomTextField(
                                       controller: _residentIdController,
                                       labelText: appLocalizations.residentId,
                                     ),
                                     20.height,
                                     CustomTextField(
                                       controller: _residentEmailController,
                                       labelText: appLocalizations.residentEmail,
                                     ),
                                     20.height,
                                     CustomTextField(
                                       controller: _residentPhoneNumberController,
                                       labelText: appLocalizations.residentPhoneNumber,
                                     ),
                                     20.height,
                                     CustomTextField(
                                       controller: _residentTypeController,
                                       labelText: appLocalizations.residentType,
                                     ),
                                     30.height,
                                     CustomFormButton(
                                         isActive: true,
                                         onPressed: () {
                                           if (_formKey.currentState!.validate()) {
                                             getBloc().add(AddResidentClickedEvent(
                                                 unitId: widget.unitId,
                                                 blockId: widget.blockId,
                                             secureAccessResidentModel: SecureAccessResidentModel(
                                                 residentName: _residentNameController.text,
                                                 residentSurname: _residentSurnameController.text,
                                                 residentId: _residentIdController.text,
                                                 residentEmail: _residentEmailController.text,
                                                 residentPhoneNumber: _residentPhoneNumberController.text,
                                                 residentType: _residentTypeController.text)));
                                           }
                                         },
                                         buttonText: getLocalization().addResident),
                                   ],
                                 ),
                               ),
                             ),
                           )),
                     ),

                   ]),
                 )));
      },
    );
  }


  @override
  ResidentsBloc initBloc() {
    return locator<ResidentsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
