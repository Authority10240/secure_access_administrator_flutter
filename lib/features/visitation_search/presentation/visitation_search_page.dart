
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:get/get.dart';
import 'package:secure_access_administrator/core/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:secure_access_administrator/core/base_classes/base_side_effects.dart';
import 'package:secure_access_administrator/core/colors.dart';
import 'package:secure_access_administrator/core/locator.dart';
import 'package:secure_access_administrator/core/text_styles.dart';
import 'package:secure_access_administrator/core/widgets/preloader_widget.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/presentation/dashboard_page.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/bloc/visitation_search_bloc.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/modal/visitation_search_criteria.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/widgets/car_description_widget.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/widgets/query_widget.dart';
import 'package:secure_access_administrator/generated/l10n.dart';


class VisitationSearchPage extends BasePage {
   VisitationSearchPage({super.key,  this.from,  this.to});
  DateTime? from;
  DateTime? to;

  @override
  _VisitationSearchPageState createState() => _VisitationSearchPageState();
}

class _VisitationSearchPageState extends BasePageState<VisitationSearchPage, VisitationSearchBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(VisitationSearchLoadVisitationEvent(
        visitationSearchCriteria: VisitationSearchCriteria(
        from: widget.from,
        to: widget.to
    )));

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController  fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumerWithSideEffects<VisitationSearchBloc, VisitationSearchPageState, VisitationSearchSideEffect>(
      bloc: getBloc(),
      sideEffectsListener: (context,effect){
        if(effect is VisitationSearchLoadVehicleSideEffect){
          if(effect.effectState == EffectState.loading){
            preloaderWidgetOverlay(context);
          }
          if(effect.effectState == EffectState.error){
            Navigator.pop(context);
            Get.snackbar(appLocalizations.error, effect.errorMessage!);
          }
          if(effect.effectState == EffectState.success){
            Navigator.pop(context);
            carDescriptionDialog(
                appLocalizations: appLocalizations,
                vehicle: effect.dashboardPageLoadVisitationsVehicleModel!,
                visitation: effect.dashboardGetVisitationsModel!

            );
          }
        }
      },
      listener: (context, state){},
      builder: (context, state) {
         return SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
           child: Column(
             children: [
               Padding(padding:  EdgeInsets.symmetric(horizontal: 20),
           child: InkWell(onDoubleTap: ()=> getBloc().add(VisitationSearchOpenDrawerEvent(personnelDrawerOpen: !state.personnelDrawerOpen!)),
               child: Card(
                 elevation: 11,
                 child: Container(
                   padding:  EdgeInsets.all( 20),
                   height:state.personnelDrawerOpen??false? 150:70,
                   width: MediaQuery.sizeOf(context).width,
                   child: state.personnelDrawerOpen??false?Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                      QueryWidget(
                          caption: 'Hello',
                          controller: idController,
                          hint: 'Search by id',
                          label: 'ID/Passport',
                          onChange: (value)=>
                              getBloc().add(VisitationSearchLoadVisitationEvent(visitationSearchCriteria: VisitationSearchCriteria(
                                  surname: surnameController.text.isNotEmpty? surnameController.text: null,
                                  name: nameController.text.isNotEmpty? nameController.text: null,
                                  idPassport: idController.text.isNotEmpty? value: null
                              )))),
                       QueryWidget(
                           caption: 'Hello',
                           controller: nameController,
                           hint: 'Search by name',
                           label: 'Name',
                           onChange: (value)=> getBloc().add(VisitationSearchLoadVisitationEvent(visitationSearchCriteria: VisitationSearchCriteria(
                               surname: surnameController.text.isNotEmpty? surnameController.text: null,
                               name: nameController.text.isNotEmpty? value: null,
                               idPassport: idController.text.isNotEmpty? idController.text: null
                           )))),
                       QueryWidget(
                           caption: 'Hello',
                           controller: surnameController,
                           hint: 'Search by surname',
                           label: 'Surname',
                           onChange: (value)=>getBloc().add(VisitationSearchLoadVisitationEvent(visitationSearchCriteria: VisitationSearchCriteria(
                               surname: surnameController.text.isNotEmpty? value: null,
                             name: nameController.text.isNotEmpty? nameController.text: null,
                             idPassport: idController.text.isNotEmpty? idController.text: null
                           )))),
                     ],
                   ): SizedBox(
                     child: Center(child: Column(
                       children: [
                         Text(appLocalizations.personalDetails,style: TextStyle(color: AppColorScheme.primary,
                             fontSize: 20),),
                                             ],
                     ),),
                   ),),
               )
               ),),
               InkWell(
                 onDoubleTap: ()=> getBloc().add(VisitationSearchOpenDrawerEvent(dateDrawerOpen: !state.dateDrawerOpen!)),
                 child: Padding(padding:  EdgeInsets.symmetric(horizontal: 20),
                   child: Card(
                     elevation: 11,
                     child: Container(
                       padding:  EdgeInsets.all( 20),

                       height: state.dateDrawerOpen??false? 150:70,
                       width: MediaQuery.sizeOf(context).width,
                       child:state.dateDrawerOpen??false? Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           QueryWidget(
                               caption: 'Hello',
                               controller: fromController,
                               hint: 'Search by id',
                               label: 'From',
                               onChange: (value){}),
                           QueryWidget(
                               caption: 'Hello',
                               controller: toController,
                               hint: 'Search by name',
                               label: 'To',
                               onChange: (value){}),
                           QueryWidget(
                               caption: 'Hello',
                               controller: unitController,
                               hint: 'Search by surname',
                               label: 'Unit',
                               onChange: (value){}),
                         ],
                       ):SizedBox(
        child: Center(child: Column(
        children: [
        Text(appLocalizations.dateSearch,
          style: TextStyle(color: AppColorScheme.primary,
            fontSize: 20),),
           ],
        ),),

        ),),
                   )
               ),
               ),
               Expanded(child: Padding(padding: EdgeInsets.all(20),child: Card(
                   elevation: 11,
                    child: Column(
                     children: [
                       StreamBuilder<QuerySnapshot<DashboardGetVisitationsModel?>>(
                           stream: state.visitations,
                           builder: (context, snapshot){
                             List<QueryDocumentSnapshot<DashboardGetVisitationsModel?>>? data = snapshot.data?.docs??[];
                             return Expanded(child:
                             ListView.builder(
                                 itemCount: snapshot.data?.docs.length??0,
                                 itemBuilder: (context, index){
                                   DashboardGetVisitationsModel? visitation = snapshot.data?.docs.elementAt(index).data();
                                   String? visitationId  = snapshot.data?.docs.elementAt(index).id;
                                   return Padding(padding: EdgeInsets.symmetric(horizontal: 20),child: Card(
                                     elevation: 11,
                                     child: Container(
                                         child: ListTile(
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
                                              getBloc().add(VisitationSearchLoadVehicleEvent(dashboardGetVisitationsModel: visitation!, visitationId: visitationId!));
                                           }else{
                                             Get.snackbar(appLocalizations.walkIn, '${visitation?.firstName} ${visitation?.lastName} ${appLocalizations.walkedIn}');
                                           }
                                         },))),));
                                 }));
                           })
                     ],
                   ),
                   )))
             ],
           ),
          )
         );
      },
    );
  }


  @override
  VisitationSearchBloc initBloc() {
    return locator<VisitationSearchBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }




}
