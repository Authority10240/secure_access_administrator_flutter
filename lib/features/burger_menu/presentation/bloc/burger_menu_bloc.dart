

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_event.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';

part 'burger_menu_event.dart';
part 'burger_menu_state.dart';

@injectable
class BurgerMenuBloc
    extends BaseBloc<BurgerMenuPageEvent, BurgerMenuPageState> {
    BurgerMenuBloc(): super(BurgerMenuPageInitState()) {}
} 
