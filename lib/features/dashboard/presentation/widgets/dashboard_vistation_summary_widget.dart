import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:secure_access_administrator/core/colors.dart';
import 'package:secure_access_administrator/core/extensions/num_extension.dart';
import 'package:secure_access_administrator/core/widgets/preloader_widget.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:secure_access_administrator/features/dashboard/presentation/dashboard_page.dart';

class DashboardVisitationSummaryWidget extends StatefulWidget {
   DashboardVisitationSummaryWidget({
     required this.onTap,
     required this.buttonCaption,
     required this.heading,
     required this.date,required this.stream, super.key});

   Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? stream;
   final String date;
   final String heading;
   final String buttonCaption;
   final Function onTap;

  @override
  State<DashboardVisitationSummaryWidget> createState() => _DashboardVisitationSummaryWidgetState();
}

class _DashboardVisitationSummaryWidgetState extends State<DashboardVisitationSummaryWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<DashboardGetVisitationsModel?>>(
      stream: widget.stream ,
      builder: (context, snapshot){
        
        int? carVisitations = snapshot.data?.docs?.where((visitation)=> visitation.data()?.transportationType == TransportationType.driveIn.toString() ).toList().length;
        int? pedestrianVisitations = snapshot.data?.docs?.where((visitation)=> visitation.data()?.transportationType == TransportationType.walkIn.toString() ).toList().length;
        return InkWell(child: Card(
          elevation: 11,
          child:  SizedBox(height: 150, width: 300,
            child:snapshot.hasData?
              Padding(padding: EdgeInsets.all(14),
                  child: Column(children: [
                Text(widget.date,
                  style: TextStyle(color: AppColorScheme.primary,
                      fontSize: 20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  SizedBox(height: 50, width: 120,
                  child: ListTile(
                    title: Text(snapshot?.data?.docs?.length?.toString()??0.toString(),
                    style:  TextStyle(color: AppColorScheme.primary,
                    fontSize: 40),),
                  subtitle: Text(widget.heading),),),
                    SizedBox(height: 70, width: 50,
                      child: Column(
                        children: [
                          20.height,
                          Icon(Icons.car_crash_sharp, color: AppColorScheme.primary,),
                         Text(carVisitations?.toString()??0.toString()),]),),
                    SizedBox(height: 70, width: 50,
                      child: Column(
                          children: [
                            20.height,
                             Icon(Icons.directions_walk_outlined, color: AppColorScheme.primary),
                            Text(pedestrianVisitations?.toString()??0.toString()),]),),

                  ],),
                    45.height,
                    Text(widget.buttonCaption,style:  TextStyle(color: AppColorScheme.primary),)
              ])):preloaderWidget(),),
        ),onTap: ()=>widget.onTap()
        ,);
      },
    );
  }
}
