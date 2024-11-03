
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:secure_access_administrator/core/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access_administrator/core/colors.dart';
import 'package:secure_access_administrator/core/locator.dart';
import 'package:secure_access_administrator/core/text_styles.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/presentation/dashboard_page.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/bloc/visitation_search_bloc.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/modal/visitation_search_criteria.dart';
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
    getBloc().add(VisitationSearchLoadVisitationEvent(visitationSearchCriteria: VisitationSearchCriteria(
      from: widget.from, to: widget.to
    )));

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<VisitationSearchBloc, VisitationSearchPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Container(
           height: MediaQuery.sizeOf(context).height,
           child: Column(
             children: [
               Padding(padding:  EdgeInsets.symmetric(horizontal: 20),
           child: InkWell(onDoubleTap: ()=> getBloc().add(VisitationSearchOpenDrawerEvent(personnelDrawerOpen: !state.personnelDrawerOpen!)),child: Card(
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
                                  idPassport: value
                              )))),
                       QueryWidget(
                           caption: 'Hello',
                           controller: nameController,
                           hint: 'Search by name',
                           label: 'Name',
                           onChange: (value)=> getBloc().add(VisitationSearchLoadVisitationEvent(visitationSearchCriteria: VisitationSearchCriteria(
                               name: value
                           )))),
                       QueryWidget(
                           caption: 'Hello',
                           controller: surnameController,
                           hint: 'Search by surname',
                           label: 'Surname',
                           onChange: (value)=>getBloc().add(VisitationSearchLoadVisitationEvent(visitationSearchCriteria: VisitationSearchCriteria(
                               surname: value
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
               onDoubleTap: ()=> getBloc().add(VisitationSearchOpenDrawerEvent(carDrawerOpen: !state.carDrawerOpen!)),
               child: Padding(padding:  EdgeInsets.symmetric(horizontal: 20),
                   child: Card(
                     elevation: 11,
                     child: Container(
                       padding:  EdgeInsets.all( 20),
                        height:state.carDrawerOpen??false? 150:70,
                       width: MediaQuery.sizeOf(context).width,
                       child:state.carDrawerOpen??false? Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           QueryWidget(
                               caption: 'Hello',
                               controller: idController,
                               hint: 'Search by id',
                               label: 'Registration',
                               onChange: (value){}),
                           QueryWidget(
                               caption: 'Hello',
                               controller: nameController,
                               hint: 'Search by name',
                               label: 'Brand',
                               onChange: (value){}),
                           QueryWidget(
                               caption: 'Hello',
                               controller: surnameController,
                               hint: 'Search by surname',
                               label: 'Color',
                               onChange: (value){}),
                         ],
                       ):SizedBox(
                         child: Center(child: Column(
                           children: [
                             Text(appLocalizations.carDetails, style: TextStyle(color: AppColorScheme.primary,
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
                               controller: idController,
                               hint: 'Search by id',
                               label: 'From',
                               onChange: (value){}),
                           QueryWidget(
                               caption: 'Hello',
                               controller: nameController,
                               hint: 'Search by name',
                               label: 'To',
                               onChange: (value){}),
                           QueryWidget(
                               caption: 'Hello',
                               controller: surnameController,
                               hint: 'Search by surname',
                               label: 'Unit',
                               onChange: (value){}),
                         ],
                       ):SizedBox(
        child: Center(child: Column(
        children: [
        Text(appLocalizations.dateSearch,style: TextStyle(color: AppColorScheme.primary,
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
                             return Expanded(child: ListView.builder(
                                 itemCount: snapshot.data?.docs.length??0,
                                 itemBuilder: (context, index){
                                   DashboardGetVisitationsModel? visitation = snapshot.data?.docs.elementAt(index).data();
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
                                           }else{
                                             Get.snackbar(appLocalizations.walkIn, '${visitation?.firstName} ${visitation?.lastName} ${appLocalizations.walkedIn}');
                                           }
                                         },))),);
                                 }));
                           })
                     ],
                   ),
                   )))
             ],
           ),
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
