

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_event.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';

part 'properties_event.dart';
part 'properties_state.dart';

@injectable
class PropertiesBloc
    extends BaseBloc<PropertiesPageEvent, PropertiesPageState> {
    PropertiesBloc(): super(PropertiesPageInitState()) {}
} 
