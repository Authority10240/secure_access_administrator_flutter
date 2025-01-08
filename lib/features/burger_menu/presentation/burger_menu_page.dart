

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


import 'package:heroicons/heroicons.dart';
import 'package:secure_access_administrator/core/base_classes/base_page.dart';
import 'package:secure_access_administrator/core/colors.dart';
import 'package:secure_access_administrator/core/locator.dart';
import 'package:secure_access_administrator/features/properties/presentation/properties_page.dart';
import 'package:secure_access_administrator/generated/l10n.dart';

import 'bloc/burger_menu_bloc.dart';


class BurgerMenuPage extends BasePage {
  const BurgerMenuPage({super.key});

  @override
  _BurgerMenuPageState createState() => _BurgerMenuPageState();
}

class _BurgerMenuPageState extends BasePageState<BurgerMenuPage, BurgerMenuBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

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
    return BlocConsumer<BurgerMenuBloc, BurgerMenuPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return SingleChildScrollView(
           child: Column(
             children: [
           Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child: Card(
           elevation: 11,
           child: ListTile(

               leading: const HeroIcon(HeroIcons.lockOpen),
               title: const Text("Property Access"),
               trailing: HeroIcon(HeroIcons.chevronRight,color: AppColorScheme.primary,),
                 )),),
               Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child: Card(
                   elevation: 11,
                   child: ListTile(
                     onTap: ()=> Get.to(const PropertiesPage()),
                     leading: const HeroIcon(HeroIcons.buildingOffice2),
                     title: const Text("Properties"),
                     trailing: HeroIcon(HeroIcons.chevronRight, color: AppColorScheme.primary,),
                   )),),
               Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child: Card(
                   elevation: 11,
                   child: ListTile(
                     leading: const HeroIcon(HeroIcons.informationCircle),
                     title: const Text("About"),
                     trailing: HeroIcon(HeroIcons.chevronRight, color: AppColorScheme.primary,),
                   )),),

             ],
           ),
         );
      },
    );
  }


  @override
  BurgerMenuBloc initBloc() {
    return locator<BurgerMenuBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  Color scaffoldBackgroundColor() {
    return Theme.of(context).scaffoldBackgroundColor;
  }




}
