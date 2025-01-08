

import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:secure_access_administrator/core/base_classes/base_page.dart';
import 'package:secure_access_administrator/core/colors.dart';
import 'package:secure_access_administrator/core/locator.dart';
import 'package:secure_access_administrator/generated/l10n.dart';

import 'bloc/property_access_bloc.dart';

class PropertyAccessPage extends BasePage {
  const PropertyAccessPage({super.key});

  @override
  _PropertyAccessPageState createState() => _PropertyAccessPageState();
}

class _PropertyAccessPageState extends BasePageState<PropertyAccessPage, PropertyAccessBloc> {

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
    return BlocConsumer<PropertyAccessBloc, PropertyAccessPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Container(
          );
      }, bloc: getBloc(),
    );
  }


  @override
  PropertyAccessBloc initBloc() {
    return locator<PropertyAccessBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
