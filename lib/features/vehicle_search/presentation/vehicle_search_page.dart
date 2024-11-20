
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secure_access_administrator/core/base_classes/base_page.dart';
import 'package:secure_access_administrator/core/base_classes/base_side_effects.dart';
import 'package:secure_access_administrator/core/colors.dart';
import 'package:secure_access_administrator/core/extensions/date_extension.dart';
import 'package:secure_access_administrator/core/locator.dart';
import 'package:secure_access_administrator/core/text_styles.dart';
import 'package:secure_access_administrator/core/widgets/preloader_widget.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access_administrator/features/vehicle_search/presentation/bloc/vehicle_search_side_effect.dart';
import 'package:secure_access_administrator/features/vehicle_search/presentation/modal/vehicle_search_criteria.dart';
import 'package:secure_access_administrator/features/vehicle_search/presentation/widgets/visitation_description_widget.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/visitation_search_page.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/widgets/query_widget.dart';
import 'package:secure_access_administrator/generated/l10n.dart';
import 'bloc/vehicle_search_bloc.dart';



class VehicleSearchPage extends BasePage {
  const VehicleSearchPage({super.key});

  @override
  _VehicleSearchPageState createState() => _VehicleSearchPageState();
}

class _VehicleSearchPageState extends BasePageState<VehicleSearchPage, VehicleSearchBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(VehicleSearchValueChangedEvent(vehicleSearchCriteria: VehicleSearchCriteria()));

  }

  TextEditingController _licenseNumberController = TextEditingController();
  TextEditingController _modelController = TextEditingController();
  TextEditingController _makeController = TextEditingController();
  TextEditingController _colorController = TextEditingController();
  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _unitController = TextEditingController();
  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();

  DateTime? to;
  DateTime? from;


    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumerWithSideEffects<VehicleSearchBloc, VehicleSearchPageState, VehicleSearchSideEffect>(
      sideEffectsListener: (context, effect){
        if(effect is VehicleSearchLoadVisitationSideEffect){

          if(effect.effectState == EffectState.loading){
            preloaderWidgetOverlay(context);
          }

          if(effect.effectState == EffectState.error){
            Navigator.pop(context);
            Get.snackbar(appLocalizations.error, effect.errorMessage!);
          }

          if(effect.effectState == EffectState.success){
            Navigator.pop(context);
            vehicleDescriptionDialog(
              visitation: effect.dashboardGetVisitationsModel!,
              vehicle: effect.dashboardPageLoadVisitationsVehicleModel!,
              appLocalizations: appLocalizations
            );
          }
        }
      },
      bloc: getBloc(),
      listener: (context, state){},
      builder: (context, state) {
         return SingleChildScrollView(
           child: Container(
               height: MediaQuery.sizeOf(context).height,
             child: Column(
               children: [
                 Padding(padding:  EdgeInsets.symmetric(horizontal: 20),
                   child: InkWell(onDoubleTap: ()=> getBloc().add(VehicleSearchOpenDrawerEvent(carDrawerOpen: !state.carDrawerOpen!)),
                       child: Card(
                         elevation: 11,
                         child: Container(
                           padding:  EdgeInsets.all( 20),
                           height:state.carDrawerOpen??false? 150:70,
                           width: MediaQuery.sizeOf(context).width,
                           child: state.carDrawerOpen??false?Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               QueryWidget(
                                   onTap: (){},
                                   caption: 'Hello',
                                   controller: _makeController,
                                   hint: 'Search by id',
                                   label: 'Make',
                                   onChange: (value)=>
                                       getBloc().add(VehicleSearchValueChangedEvent(vehicleSearchCriteria: VehicleSearchCriteria(
                                            color: _colorController.text.isNotEmpty? _unitController.text:null,
                                           idNumber: _idNumberController.text.isNotEmpty? _idNumberController.text:null,
                                           licenseNumber: _licenseNumberController.text.isNotEmpty? _licenseNumberController.text:null,
                                           make: _makeController.text.isNotEmpty? _makeController.text:null,
                                           model: _modelController.text.isNotEmpty? _modelController.text:null,
                                           to: to,
                                           from: from,
                                           unit: _unitController.text.isNotEmpty? _unitController.text:null

                                       )))),
                               QueryWidget(
                                   onTap: (){},
                                   caption: 'Hello',
                                   controller: _modelController,
                                   hint: 'Search by name',
                                   label: 'Model',
                                   onChange: (value)=>   getBloc().add(VehicleSearchValueChangedEvent(vehicleSearchCriteria: VehicleSearchCriteria(
                                       color: _colorController.text.isNotEmpty? _unitController.text:null,
                                       idNumber: _idNumberController.text.isNotEmpty? _idNumberController.text:null,
                                       licenseNumber: _licenseNumberController.text.isNotEmpty? _licenseNumberController.text:null,
                                       make: _makeController.text.isNotEmpty? _makeController.text:null,
                                       model: _modelController.text.isNotEmpty? _modelController.text:null,
                                       to: to,
                                       from: from,
                                       unit: _unitController.text.isNotEmpty? _unitController.text:null

                                   )))),
                               QueryWidget(
                                   onTap: (){},
                                   caption: 'Hello',
                                   controller: _colorController,
                                   hint: 'Search by surname',
                                   label: 'Color',
                                   onChange: (value)=>   getBloc().add(VehicleSearchValueChangedEvent(vehicleSearchCriteria: VehicleSearchCriteria(
                                       color: _colorController.text.isNotEmpty? _unitController.text:null,
                                       idNumber: _idNumberController.text.isNotEmpty? _idNumberController.text:null,
                                       licenseNumber: _licenseNumberController.text.isNotEmpty? _licenseNumberController.text:null,
                                       make: _makeController.text.isNotEmpty? _makeController.text:null,
                                       model: _modelController.text.isNotEmpty? _modelController.text:null,
                                       to: to,
                                       from: from,
                                       unit: _unitController.text.isNotEmpty? _unitController.text:null

                                   )))),
                             ],
                           ): SizedBox(
                             child: Center(child: Column(
                               children: [
                                 Text(appLocalizations.vehicle,style: TextStyle(color: AppColorScheme.primary,
                                     fontSize: 20),),
                               ],
                             ),),
                           ),),
                       )
                   ),),
                 InkWell(
                   onDoubleTap: ()=> getBloc().add(VehicleSearchOpenDrawerEvent(dateDrawerOpen: !state.dateDrawerOpen!)),
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
                                 onClear: (){
                                   from = null;
                                   _fromController.text = '';
                                   getBloc().add(VehicleSearchValueChangedEvent(vehicleSearchCriteria: VehicleSearchCriteria(
                                       color: _colorController.text.isNotEmpty? _unitController.text:null,
                                       idNumber: _idNumberController.text.isNotEmpty? _idNumberController.text:null,
                                       licenseNumber: _licenseNumberController.text.isNotEmpty? _licenseNumberController.text:null,
                                       make: _makeController.text.isNotEmpty? _makeController.text:null,
                                       model: _modelController.text.isNotEmpty? _modelController.text:null,
                                       to: to,
                                       from: from,
                                       unit: _unitController.text.isNotEmpty? _unitController.text:null

                                   )));

                                 },
                                 caption: 'Hello',
                                 controller: _fromController,
                                 hint: 'Search by id',
                                 label: 'From',
                                 onChange: (value){},
                                 onTap: ()async{
                                   try {
                                     from =
                                     await showDatePicker(context: context,
                                       firstDate: DateTime.now().subtract(
                                           Duration(days: 1825)),
                                       lastDate: DateTime.now().add(
                                           Duration(days: 1825))
                                       , currentDate: DateTime.now(),
                                       errorFormatText: 'no date selected',
                                       errorInvalidText: 'no date selected'
                                     );
                                     if(from != null) {
                                       _fromController.text =
                                           from.toString().toFormattedDate();
                                     }else{
                                       _fromController.text = '';
                                     }
                                     getBloc().add(
                                         VehicleSearchValueChangedEvent(
                                             vehicleSearchCriteria: VehicleSearchCriteria(
                                                 color: _colorController.text
                                                     .isNotEmpty
                                                     ? _unitController.text
                                                     : null,
                                                 idNumber: _idNumberController
                                                     .text.isNotEmpty
                                                     ? _idNumberController.text
                                                     : null,
                                                 licenseNumber: _licenseNumberController
                                                     .text.isNotEmpty
                                                     ? _licenseNumberController
                                                     .text
                                                     : null,
                                                 make: _makeController.text
                                                     .isNotEmpty
                                                     ? _makeController.text
                                                     : null,
                                                 model: _modelController.text
                                                     .isNotEmpty
                                                     ? _modelController.text
                                                     : null,
                                                 to: to,
                                                 from: from,
                                                 unit: _unitController.text
                                                     .isNotEmpty
                                                     ? _unitController.text
                                                     : null

                                             )));
                                   }catch(ex){

                                   }
                                 },),
                               QueryWidget(
                                 caption: 'Hello',
                                 controller: _unitController,
                                 hint: 'Search by surname',
                                 label: 'Unit',
                                 onChange: (value){},
                                 onTap: ()=>     getBloc().add(VehicleSearchValueChangedEvent(vehicleSearchCriteria: VehicleSearchCriteria(
                                     color: _colorController.text.isNotEmpty? _unitController.text:null,
                                     idNumber: _idNumberController.text.isNotEmpty? _idNumberController.text:null,
                                     licenseNumber: _licenseNumberController.text.isNotEmpty? _licenseNumberController.text:null,
                                     make: _makeController.text.isNotEmpty? _makeController.text:null,
                                     model: _modelController.text.isNotEmpty? _modelController.text:null,
                                     to: to,
                                     from: from,
                                     unit: _unitController.text.isNotEmpty? _unitController.text:null



                                 ))),),



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
                       StreamBuilder<QuerySnapshot<DashboardPageLoadVisitationsVehicleModel?>>(
                           stream: state.visitations,
                           builder: (context, snapshot){
                             List<QueryDocumentSnapshot<DashboardPageLoadVisitationsVehicleModel?>>? data = snapshot.data?.docs??[];
                             return Expanded(child:
                             ListView.builder(
                                 itemCount: snapshot.data?.docs.length??0,
                                 itemBuilder: (context, index){
                                   DashboardPageLoadVisitationsVehicleModel? visitation = snapshot.data?.docs.elementAt(index).data();
                                   String? visitationId  = snapshot.data?.docs.elementAt(index).id;
                                   return Padding(padding: EdgeInsets.symmetric(horizontal: 20),child: Card(
                                     elevation: 11,
                                     child: Container(
                                         child: ListTile(
                                           leading: Text("Unit: ${visitation?.unit??""}",
                                             style: textStyleSubHeading(),),
                                           title: Text("${appLocalizations.make}: ${visitation?.make??""}\n"
                                               "${appLocalizations.model}: ${visitation?.model??""}",style: textStyleSubHeading(),),
                                           subtitle: Text("Date: ${visitation?.date!} Time:${visitation?.time}",),
                                           trailing: InkWell(
                                             child: Icon(

                                               Icons.directions_walk,
                                               color: Colors.blue,),
                                             onTap: (){

                                                 getBloc().add(VehicleSearchLoadVisitationEvent(dashboardPageLoadVisitationsVehicleModel: visitation!));

                                             },),
                                         )),));
                                 }));
                           })
                     ],
                   ),
                 )))
               ],
             ),
           ),
          );
      },
    );
  }


  @override
  VehicleSearchBloc initBloc() {
    return locator<VehicleSearchBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


  @override
  FloatingActionButtonLocation? floatingActionButtonLocation() {
    return FloatingActionButtonLocation.centerDocked;
  }

  @override
  Widget? floatingActionButton() {
    return Card(
      elevation: 11,
      shadowColor: AppColorScheme.primary,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 6,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
          InkWell(onTap: (){ Get.back();
          Get.to(VisitationSearchPage());}
              ,child: SizedBox(height: 50,
                width: 50,
                child: Icon(Icons.directions_walk),)),
          Container(height: 40,width: 2,color: AppColorScheme.primary,),
          InkWell(onTap: (){
            Get.back();
            Get.to(VehicleSearchPage());
          },child: SizedBox(height: 50,
            width: 50,
            child: Icon(Icons.car_crash_sharp),))
        ],),
      ),
    );
  }



}
