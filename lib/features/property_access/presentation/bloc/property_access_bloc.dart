
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_event.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';

part 'property_access_event.dart';
part 'property_access_state.dart';

@injectable
class PropertyAccessBloc
    extends BaseBloc<PropertyAccessPageEvent, PropertyAccessPageState> {
    PropertyAccessBloc(): super(PropertyAccessPageInitState()) {}
} 
