import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:heroicons/heroicons.dart';
import 'package:secure_access_administrator/core/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:secure_access_administrator/core/base_classes/base_side_effects.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';
import 'package:secure_access_administrator/core/colors.dart';
import 'package:secure_access_administrator/core/extensions/date_extension.dart';
import 'package:secure_access_administrator/core/extensions/num_extension.dart';
import 'package:secure_access_administrator/core/locator.dart';
import 'package:secure_access_administrator/core/sizes.dart';
import 'package:secure_access_administrator/core/text_styles.dart';
import 'package:secure_access_administrator/core/widgets/preloader_widget.dart';
import 'package:secure_access_administrator/features/dashboard/presentation/bloc/dashboard_side_effects.dart';
import 'package:secure_access_administrator/features/dashboard/presentation/widgets/car_description_widget.dart';
import 'package:secure_access_administrator/features/dashboard/presentation/widgets/dashboard_vistation_summary_widget.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/visitation_search_page.dart';
import 'package:secure_access_administrator/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:secure_access_repository/models/repository_models.dart';
import 'bloc/dashboard_bloc.dart';

const double height34 = 34;
const double radius8 = 8;
const double size11 = 11;
const String dateFormat = 'MMMM yyy';
const String local = 'en_us';
const double width1 = 1;
const double fontSize10 = 10;
const String fontFamilyLato = "Lato";
const double calendarHeight = 280;
const int firstDayOfTheWeek = 0;
const int minSelectedDate = 360;
const int maxSelectedDate = 360;


class DashboardPage extends BasePage {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends BasePageState<DashboardPage, DashboardBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(DashBoardGetVisitationEvent());

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumerWithSideEffects<DashboardBloc, DashboardPageState,DashboardPageSideEffect>(
      sideEffectsListener: (context, effect){
        if(effect is DashBoardPageLoadVisitationVehicleSideEffect){
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
      bloc: getBloc(),
      listener: (context, state){
        if(state is DashboardPageGetVisitationState){

          if(state.dataState == DataState.loading) {
            preloaderWidgetOverlay(context);
          }
              if(state.dataState == DataState.error){
                Navigator.pop(context);
                Get.snackbar(appLocalizations.error, state.errorMessage!);
              }
        }

        if(state is DashBoardCalendarDateSelectedState){

          if(state.dataState == DataState.error){
            Navigator.pop(context);
            Get.snackbar(appLocalizations.error, state.errorMessage!);
          }
        }
      },
      builder: (context, state) {
       return
            SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.all(borderRadius),
                child:  Padding(
                  padding:  EdgeInsets.all(pagePadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(color: Colors.white,height: 200,
                           child:
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            DashboardVisitationSummaryWidget(
                              onTap: ()=> Get.to(VisitationSearchPage(to: DateTime.now() , from: DateTime.now(),)),
                              buttonCaption: appLocalizations.more,
                              heading: appLocalizations.visitations,
                              stream: state.todaysVisitations,
                              date: appLocalizations.today,),
                            DashboardVisitationSummaryWidget(
                              onTap: ()=> Get.to(VisitationSearchPage(to: DateTime.now().subtract(Duration(days: 1)) , from: DateTime.now().subtract(Duration(days: 1)),)),
                              buttonCaption: appLocalizations.more,
                              heading: appLocalizations.visitations,
                              stream: state.yesterdaysVisitations,
                              date: appLocalizations.yesterday,),
                            DashboardVisitationSummaryWidget(
                                onTap: ()=> Get.to(VisitationSearchPage(to: DateTime.now().subtract(Duration(days: 2)) , from: DateTime.now().subtract(Duration(days: 2)),)),
                                buttonCaption: appLocalizations.more,
                                heading: appLocalizations.visitations,
                                stream: state.twoDaysBackVisitations,
                                date: DateTime.now().subtract(const Duration(days: 2)).toString().toFormattedDate()),
                            DashboardVisitationSummaryWidget(
                                onTap: ()=> Get.to(VisitationSearchPage(to: DateTime.now().subtract(Duration(days: 3)) , from: DateTime.now().subtract(Duration(days: 3)),)),
                                buttonCaption: appLocalizations.more,
                                heading: appLocalizations.visitations,
                                stream: state.threeDaysBackVisitations,
                                date: DateTime.now().subtract(const Duration(days: 3)).toString().toFormattedDate()),
                            DashboardVisitationSummaryWidget(
                                onTap: ()=> Get.to(VisitationSearchPage(to: DateTime.now().subtract(Duration(days: 4)) , from: DateTime.now().subtract(Duration(days: 4)),)),
                                buttonCaption: appLocalizations.more,
                                heading: appLocalizations.visitations,
                                stream: state.fourDaysBackVisitations,
                                date: DateTime.now().subtract(const Duration(days: 4)).toString().toFormattedDate()),
                            DashboardVisitationSummaryWidget(
                                onTap: ()=> Get.to(VisitationSearchPage(to: DateTime.now().subtract(Duration(days: 5)) , from: DateTime.now().subtract(Duration(days: 5)),)),
                                buttonCaption: appLocalizations.more,
                                heading: appLocalizations.visitations,
                                stream: state.fiveDaysBackVisitations,
                                date: DateTime.now().subtract(const Duration(days: 5)).toString().toFormattedDate()),
                            DashboardVisitationSummaryWidget(
                                onTap: ()=> Get.to(VisitationSearchPage(to: DateTime.now().subtract(Duration(days: 6)) , from: DateTime.now().subtract(Duration(days: 6)),)),
                                buttonCaption: appLocalizations.more,
                                heading: appLocalizations.visitations,
                                stream: state.sixDaysBackVisitations,
                                date: DateTime.now().subtract(const Duration(days: 6)).toString().toFormattedDate()),

                          ],),

                        ),
                        20.height,
                        Card(child: SizedBox(
                          height: 700,
                          child:Row(children: [
                            Card(elevation: 11, child:SizedBox(width: MediaQuery.sizeOf(context).width/2,child:
                            Padding(padding: EdgeInsets.all(20) ,
                                child:Column(children: [
                                  Text(getBloc().currentMonth,style: TextStyle(color: AppColorScheme.primary, fontSize: 28),),
                              20.height,
                              Expanded(child:
                              CalendarCarousel<Event>(
                            weekdayTextStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: fontSize10 ,
                                fontFamily: fontFamilyLato,
                                fontWeight: FontWeight.w700),
                            onDayPressed: (date, events) {
                              getBloc().add(DashBoardCalendarDateSelectedEvent(dateTime: date, events: events));
                            },
                            isScrollable: true,
                            selectedDayButtonColor: AppColorScheme.primary,
                            selectedDayBorderColor: AppColorScheme.primary,
                            daysTextStyle: const TextStyle(color: Colors.black),
                            showOnlyCurrentMonthDate: true,
                            showWeekDays: true,
                            firstDayOfWeek: 0,
                            selectedDateTime: getBloc().currentDate2,
                            targetDateTime: getBloc().targetDateTime,
                            customGridViewPhysics: const NeverScrollableScrollPhysics(),
                            todayBorderColor: AppColorScheme.primary,
                            todayButtonColor: AppColorScheme.primary,
                            todayTextStyle: const TextStyle(color: Colors.white),
                            showHeader: false,
                            selectedDayTextStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            minSelectedDate: getBloc().currentDate.subtract(const Duration(days: minSelectedDate)),
                            maxSelectedDate: getBloc().currentDate.add(const Duration(days: maxSelectedDate)),
                            onCalendarChanged: (DateTime date) {
                              getBloc().add(DashBoardCalendarChangedEvent(dateTime: date));
                            },
                            weekendTextStyle: const TextStyle(color: Colors.black),

                          )
                              )
                                ])
                            ),
                            )
                            ),
                            Expanded(child: Card(
                              elevation: 11,
                              child: Padding(padding: EdgeInsets.all(20), child: Column(
                                children: [
                                  Text('${getBloc().currentDate2.toString().toFormattedDate()} ${appLocalizations.visitations}',
                                    style: TextStyle(color: AppColorScheme.primary, fontSize: 28),),
                                  StreamBuilder<QuerySnapshot<SecureAccessVisitationsModel?>>(
                                      stream: state.calenderDayVisitations,
                                      builder: (context, snapshot){
                                        List<QueryDocumentSnapshot<SecureAccessVisitationsModel?>>? data = snapshot.data?.docs??[];
                                        return Expanded(child: ListView.builder(
                                            itemCount: snapshot.data?.docs.length??0,
                                            itemBuilder: (context, index){
                                              SecureAccessVisitationsModel? visitation = snapshot.data?.docs.elementAt(index).data();
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
                                                      color: AppColorScheme.primary,),
                                                    onTap: (){
                                                      if(visitation?.transportationType == TransportationType.driveIn.toString()) {
                                                        getBloc().add(DashBoardPageLoadVisitationVehicleEvent(
                                                            visitationId: visitationId!,
                                                            dashboardGetVisitationsModel: visitation!));
                                                      }else{
                                                        Get.snackbar(appLocalizations.walkIn, '${visitation?.firstName} ${visitation?.lastName} ${appLocalizations.walkedIn}');
                                                      }
                                                    },))),);
                                            }));
                                      })
                                ],
                              ),
                            )))
                          ]
                          )
                        ,)
                          ,)


                      ]
                  ),
                ),
        ));
        });
  }


  @override
  DashboardBloc initBloc() {
    return locator<DashboardBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  Widget? floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: AppColorScheme.primary,
      onPressed:()=> Get.to(()=> VisitationSearchPage()),
      child:const HeroIcon(
        HeroIcons.arrowsRightLeft,
        color: Colors.white,) ,);
  }




}


enum TransportationType{
  walkIn,
  driveIn
}
