
import 'package:get/get.dart';
import 'package:secure_access_administrator/core/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access_administrator/core/colors.dart';
import 'package:secure_access_administrator/core/locator.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/visitation_search_page.dart';
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

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<VehicleSearchBloc, VehicleSearchPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Container(
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
