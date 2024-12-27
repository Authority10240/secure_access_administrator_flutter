
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:secure_access_administrator/core/base_classes/base_page.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';
import 'package:secure_access_administrator/core/colors.dart';
import 'package:secure_access_administrator/core/constants/images.dart';
import 'package:secure_access_administrator/core/hive_storage.dart';
import 'package:secure_access_administrator/core/locator.dart';
import 'package:secure_access_administrator/core/sizes.dart';
import 'package:secure_access_administrator/core/text_styles.dart';
import 'package:secure_access_administrator/core/utils.dart';
import 'package:secure_access_administrator/core/widgets/custom_form_button.dart';
import 'package:secure_access_administrator/core/widgets/custom_text_field.dart';
import 'package:secure_access_administrator/core/widgets/preloader_widget.dart';
import 'package:secure_access_administrator/features/dashboard/presentation/dashboard_page.dart';
import 'package:secure_access_administrator/features/login/data/data_source/local/hive/sign_in_local_storage/sign_in_local_model.dart';
import 'package:secure_access_administrator/features/login/presentation/bloc/login_bloc.dart';
import 'package:secure_access_administrator/generated/l10n.dart';
import '../data/data_source/local/hive/biometrics_local_storage/model/biometrics_local_model.dart';


class LoginPage extends BasePage {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage, LoginBloc> {


  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  late String phoneNumber ;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkBiometricsLogin();

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginPageState>(
      listener: (context, state){

        if(state is SignInClickedState && state.dataState == DataState.loading){
          preloaderWidgetOverlay(context);
        }

        if(state is SignInClickedState && state.dataState == DataState.success){
          Navigator.pop(context);
          Get.snackbar(getLocalization().welcome, state.userCredential?.user?.displayName?? state.userCredential?.user?.email?? "user");
          Get.offAll(const DashboardPage());
        }

        if(state is SignInClickedState && state.dataState == DataState.error){
          Navigator.pop(context);
          Get.snackbar(getLocalization().error, state.errorMessage!);
        }
      },
      builder: (context, state) {
         return SingleChildScrollView(
           child: Padding(
             padding:  EdgeInsets.all(borderRadius),
             child: Form(
               key: _formKey,
               child: Padding(
                 padding:  EdgeInsets.only(left: pagePadding, right: pagePadding),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     smallMediumSpacer,
                     Center(child: Text(appLocalizations.welcomeTo, style: textStyleSubHeading(),)),
                     smallSpacer,
                     Center(child:
                     SizedBox(
                       height: 150,
                       child: Image.asset(AppAssets.logoImageJpeg),
                     ),
                     ),
                     labelSpacer,
                     Center(child: Text(appLocalizations.signInUsing, style:  textStyleDirectives(),)),
                     smallMediumSpacer,
                     CustomTextField(
                       controller: _usernameController,
                       labelText: getLocalization().emailAddress,
                       validator: (value ) {
                         return value!.isEmpty? getLocalization().pleaseEnterEmailAddress.toString():
                         !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                             .hasMatch(value??"")?getLocalization().pleaseEnterAValidEmailAddress:null;
                       },
                       suffixIcon: HeroIcon(HeroIcons.atSymbol, color: AppColorScheme.primary,),
                     ),
                     smallSpacer,
                     Center(child: Text(appLocalizations.and, style:  textStyleDirectives(),)),
                     smallSpacer,
                     CustomTextField(

                       obscure: state.obscure,
                       controller: _passWordController,
                       labelText: getLocalization().password,
                       validator: (value ) {
                         return value!.isEmpty? getLocalization().pleaseEnterAPassword: null;
                       },
                       suffixIcon: InkWell(onTap: (){
                          getBloc().add(PasswordVisibleEvent());
                       },child: HeroIcon(state.obscure? HeroIcons.eye: HeroIcons.eyeSlash, color: AppColorScheme.primary,)),
                     ),

                     largeSpacer,
                     CustomFormButton(
                         isActive: true,
                         onPressed: (){
                           if(_formKey.currentState!.validate()){
                             getBloc().add(SignInClickedEvent(
                                 password: _passWordController.text.trim(),
                                 username: _usernameController.text.trim()));
                           }
                         },
                         buttonText: getLocalization().signIn),
                     smallSpacer,


                     ]
                 ),
               ),
             ),
           ),
         );
      },
    );
  }


  @override
  LoginBloc initBloc() {
    return locator<LoginBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  

  void checkBiometricsLogin() {
    if (boxBiometrics.isNotEmpty && boxSignIn.isNotEmpty) {
      BiometricsLocalModel biometricsLocalModel = boxBiometrics.get(current);
      SignInLocalModel signInLocalModel = boxSignIn.get(current);
      if (biometricsLocalModel.enabled! && signInLocalModel.signedIn!
      ) {
        isAuthenticated(onSuccess: () {
          boxSignIn.put(current, SignInLocalModel(signedIn: true));

        },
            onError: () {},
            biometricsMessage: getLocalization().authenticateUsingBiometrics);
      }
    }
  }


}
