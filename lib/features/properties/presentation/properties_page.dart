import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:secure_access_administrator/core/base_classes/base_page.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';
import 'package:secure_access_administrator/core/colors.dart';
import 'package:secure_access_administrator/core/extensions/num_extension.dart';
import 'package:secure_access_administrator/core/locator.dart';
import 'package:secure_access_administrator/core/text_styles.dart';
import 'package:secure_access_administrator/core/widgets/custom_form_button.dart';
import 'package:secure_access_administrator/core/widgets/custom_text_field.dart';
import 'package:secure_access_administrator/core/widgets/preloader_widget.dart';
import 'package:secure_access_administrator/features/property_access/presentation/property_access_page.dart';
import 'package:secure_access_administrator/generated/l10n.dart';
import 'package:secure_access_repository/models/secure_access_block_model/secure_access_blocks_model.dart';

import 'bloc/properties_bloc.dart';

class PropertiesPage extends BasePage {
  const PropertiesPage({super.key});

  @override
  _PropertiesPageState createState() => _PropertiesPageState();
}

class _PropertiesPageState
    extends BasePageState<PropertiesPage, PropertiesBloc> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(PropertiesGetBlocksEvent());
  }

  final TextEditingController _blockNameController = TextEditingController();
  final TextEditingController _blockNumberController = TextEditingController();
  final TextEditingController _blockSectionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  PreferredSizeWidget? buildAppbar() {
    return AppBar(
      leading: InkWell(
        child: HeroIcon(
          HeroIcons.chevronLeft,
          color: AppColorScheme.primary,
        ),
        onTap: () => Get.back(),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<PropertiesBloc, PropertiesPageState>(
      bloc: getBloc(),
      listener: (context, state) {
        if(state is PropertiesAddBlockClickedState) {
          if (state.dataState == DataState.loading) {
            preloaderWidgetOverlay(context);
          }

          if (state.dataState == DataState.success) {
            Navigator.pop(context);
            Get.snackbar(
                appLocalizations.success, appLocalizations.blockAddedSuccessful!);
            blockClearTextFields();
          }

          if (state.dataState == DataState.error) {
            Navigator.pop(context);
            Get.snackbar(appLocalizations.error, state.errorMessage!);
          }
        }

      },
      builder: (context, state) {
        return SingleChildScrollView(
            child: Card(

                    child: SizedBox(
height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(children: [
                        Card(
                            elevation: 11,
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width /3,
                              child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(children: [
                                    Text(appLocalizations.blocks,
                                        style: TextStyle(
                                            color: AppColorScheme.primary,
                                            fontSize: 28)),
                                    20.height,
                                    Expanded(
                                        child:
                                        (state.dataState == DataState.loading &&
                                            state is PropertiesGetBlocksState)
                                            ? Center(
                                          child: preloaderWidget(),
                                        )
                                            :  Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                children: [

                                                  StreamBuilder<
                                                      QuerySnapshot<
                                                          SecureAccessBlocksModel?>>(
                                                      stream: state.residenceBlock,
                                                      builder: (context, snapshot) {
                                                        List<
                                                            QueryDocumentSnapshot<
                                                                SecureAccessBlocksModel?>>?
                                                        data =
                                                            snapshot.data?.docs ??
                                                                [];
                                                        return Expanded(
                                                            child: ListView.builder(
                                                                itemCount: snapshot
                                                                    .data
                                                                    ?.docs
                                                                    .length ??
                                                                    0,
                                                                itemBuilder:
                                                                    (context,
                                                                    index) {
                                                                  SecureAccessBlocksModel?
                                                                  block =
                                                                  snapshot.data
                                                                      ?.docs
                                                                      .elementAt(
                                                                      index)
                                                                      .data();
                                                                  String? blockId =
                                                                      snapshot.data
                                                                          ?.docs
                                                                          .elementAt(
                                                                          index)
                                                                          .id;
                                                                  return Card(
                                                                    elevation: 11,
                                                                    child: Container(
                                                                        child: ListTile(
                                                                            leading: Text(
                                                                              block!.blockNameName?.substring(0,1)??'B',
                                                                              style:
                                                                              textStyleSubHeading(),
                                                                            ),
                                                                            title: Text(
                                                                              block?.blockNameName ?? "",
                                                                              style:
                                                                              textStyleSubHeading(),
                                                                            ),
                                                                            subtitle: Text(
                                                                              block?.blockSection ?? "",
                                                                            ),
                                                                            trailing: SizedBox(width: 60,
                                                                              child: Row(
                                                                                children: [
                                                                                  InkWell(
                                                                                    child:
                                                                                    HeroIcon(
                                                                                      HeroIcons.xMark,
                                                                                      color:
                                                                                      AppColorScheme.primary,
                                                                                    ),
                                                                                    onTap:
                                                                                        () {

                                                                                      getBloc().add(PropertiesDeleteBlockEvent(blockid: blockId!));
                                                                                        },
                                                                                  ),
                                                                                  SizedBox(width: 10,),
                                                                                  InkWell(
                                                                                    child:
                                                                                    HeroIcon(
                                                                                      HeroIcons.chevronRight,
                                                                                      color:
                                                                                      AppColorScheme.primary,
                                                                                    ),
                                                                                    onTap: ()=>Get.to(PropertyAccessPage(blockId: blockId!)),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ))),
                                                                  );
                                                                }));
                                                      })
                                                ],
                                              ),
                                            ))
                                  ])),
                            )),
                        Expanded(
                          child: Card(
                              elevation: 11,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                          
                                child: SizedBox( width: MediaQuery.sizeOf(context).width/2,
                                  child: Form(
                                    key: _formKey,
                                    child: Column(

                                      children: [
                                        Text(appLocalizations.addNewBlock,
                                            style: TextStyle(
                                                color: AppColorScheme.primary,
                                                fontSize: 28)),
                                        20.height,
                                        CustomTextField(
                                          controller: _blockNumberController,
                                          labelText: appLocalizations.blockNumber,
                                        ),
                                        20.height,
                                        CustomTextField(
                                          controller: _blockNameController,
                                          labelText: appLocalizations.blockName,
                                        ),
                                        20.height,
                                        CustomTextField(
                                          controller: _blockSectionController,
                                          labelText: appLocalizations.blockSection,
                                        ),
                                        30.height,
                                        CustomFormButton(
                                            isActive: true,
                                            onPressed: () {
                                              if (_formKey.currentState!.validate()) {
                                                getBloc().add(PropertiesAddBlockClickedEvent(
                                                    secureAccessBlocksModel:
                                                        SecureAccessBlocksModel(
                                                            blockNumber:
                                                                _blockNumberController
                                                                    .text,
                                                            blockNameName:
                                                                _blockNameController
                                                                    .text,
                                                            blockSection:
                                                                _blockSectionController
                                                                    .text)));
                                              }
                                            },
                                            buttonText: getLocalization().addBlock),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ),

                      ]),
                    )));
      },
    );
  }

  @override
  PropertiesBloc initBloc() {
    return locator<PropertiesBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  void blockClearTextFields() {
    _blockNameController.clear();
    _blockNumberController.clear();
    _blockSectionController.clear();
  }
}
