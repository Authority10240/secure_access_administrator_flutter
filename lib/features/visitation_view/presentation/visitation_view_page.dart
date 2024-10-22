
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:get/get.dart';
import 'package:secure_access_administrator/core/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:secure_access_administrator/core/base_classes/base_side_effects.dart';
import 'package:secure_access_administrator/core/locator.dart';
import 'package:secure_access_administrator/core/sizes.dart';
import 'package:secure_access_administrator/core/text_styles.dart';
import 'package:secure_access_administrator/core/widgets/preloader_widget.dart';
import 'package:secure_access_administrator/features/dashboard/presentation/dashboard_page.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_model.dart';
import 'package:secure_access_administrator/features/visitation_view/presentation/widget/visitation_car_description_widget.dart';
import 'package:secure_access_administrator/generated/l10n.dart';

import 'bloc/visitation_view_bloc.dart';
import 'bloc/visitation_view_side_effect.dart';


class VisitationViewPage extends BasePage {
  const VisitationViewPage({super.key, required this.date});

  final String date ;

  @override
  _VisitationViewPageState createState() => _VisitationViewPageState();
}

class _VisitationViewPageState extends BasePageState<VisitationViewPage, VisitationViewBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(VisitationViewLoadVisitationEvent(date: widget.date));

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumerWithSideEffects<VisitationViewBloc, VisitationViewPageState, VisitationViewSideEffect>(
      bloc: getBloc(),
      sideEffectsListener:(context, effect) {
        if(effect is VisitationViewLoadVisitationVehicleSideEffect
        ){

          if(effect.effectState == EffectState.loading) {
            preloaderWidgetOverlay(context);
          }
          if(effect.effectState == EffectState.error){
            Navigator.pop(context);
            Get.snackbar(appLocalizations.error, effect.errorMessage!);
          }

          if(effect.effectState == EffectState.success) {
            Navigator.pop(context);
            visitationCarDescriptionDialog(
                appLocalizations: appLocalizations,
                vehicle: effect.visitationViewLoadVisitationVehicleModel!,
                visitation: effect.visitationViewLoadVisitationModel!

            );
          }
        }
      },
      listener: (context, state){},
      builder: (context, state) {
         return         SingleChildScrollView(
           child: Padding(
             padding:  EdgeInsets.all(borderRadius),
             child:  Padding(
               padding:  EdgeInsets.all(pagePadding),
               child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     smallSpacer,
                     Center(child: Text(appLocalizations.welcomeTo, style: textStyleSubHeading(),)),
                     smallSpacer,
                     Center(child: Text(appLocalizations.complexName, style: textStyleTitle(),)),
                     smallSpacer,
                     Center(child: Text(appLocalizations.whoHasBeenHereToday, style: textStyleDirectives(),)),
                     mediumSpacer,
                     StreamBuilder<QuerySnapshot<VisitationViewLoadVisitationModel?>>(
                         stream: state.visitations,
                         builder: (context, snapshot){
                           List<QueryDocumentSnapshot<VisitationViewLoadVisitationModel?>>? data = snapshot.data?.docs??[];
                           return ListView.builder(
                               shrinkWrap: true,
                               physics: const NeverScrollableScrollPhysics(),
                               itemCount: snapshot.data?.docs.length??0,
                               itemBuilder: (context, index){
                                 VisitationViewLoadVisitationModel? visitation = snapshot.data?.docs.elementAt(index).data();
                                 String? visitationId  = snapshot.data?.docs.elementAt(index).id;
                                 return Card(elevation: 11,child: Container( child: ListTile(
                                     leading: Text("Unit: ${visitation?.unit??""}",style: textStyleSubHeading(),),
                                     title: Text("${appLocalizations.name}: ${visitation?.firstName??""}\n"
                                         "${appLocalizations.surname}: ${visitation?.lastName??""}",style: textStyleSubHeading(),),
                                     subtitle: Text("Date: ${visitation?.date!} Time:${visitation?.time}",),
                                     trailing: InkWell(
                                       child: Icon(
                                         visitation?.transportationType == TransportationType.driveIn.toString()?
                                         Icons.car_crash_sharp :
                                         Icons.directions_walk_outlined,
                                         color: Colors.blue,),
                                       onTap: (){
                                         if(visitation?.transportationType == TransportationType.driveIn.toString()) {
                                           getBloc().add(VisitationViewLoadVisitationVehicleEvent(
                                               visitationViewLoadVisitationModel: visitation!));
                                         }else{
                                           Get.snackbar('Walk in', '${visitation?.firstName} ${visitation?.lastName} walked in');
                                         }
                                       },))),);
                               });
                         })
                   ]
               ),
             ),
           ),
         );
      },
    );
  }


  @override
  VisitationViewBloc initBloc() {
    return locator<VisitationViewBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
