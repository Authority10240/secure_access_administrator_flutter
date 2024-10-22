
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:secure_access_administrator/core/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access_administrator/core/locator.dart';
import 'package:secure_access_administrator/core/sizes.dart';
import 'package:secure_access_administrator/core/text_styles.dart';
import 'package:secure_access_administrator/features/dashboard/presentation/dashboard_page.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_model.dart';
import 'package:secure_access_administrator/generated/l10n.dart';

import 'bloc/visitation_view_bloc.dart';


class VisitationViewPage extends BasePage {
  const VisitationViewPage({super.key, required this.visitationViewLoadVisitationModel});

  final VisitationViewLoadVisitationModel visitationViewLoadVisitationModel;

  @override
  _VisitationViewPageState createState() => _VisitationViewPageState();
}

class _VisitationViewPageState extends BasePageState<VisitationViewPage, VisitationViewBloc> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(VisitationViewLoadVisitationEvent(date: widget.visitationViewLoadVisitationModel.date!));

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<VisitationViewBloc, VisitationViewPageState>(
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
