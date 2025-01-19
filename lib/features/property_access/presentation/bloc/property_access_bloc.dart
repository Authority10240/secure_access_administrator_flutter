
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_event.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';
import 'package:secure_access_administrator/features/property_access/domain/use_cases/property_access_usecase/property_access_get_units_usecase.dart';
import 'package:secure_access_repository/models/secure_access_block_model/secure_access_blocks_model.dart';
import 'package:secure_access_repository/models/secure_access_property_model/secure_access_properties_model.dart';
import 'package:secure_access_repository/models/secure_access_units_model/secure_access_units_model.dart';

part 'property_access_event.dart';
part 'property_access_state.dart';

@injectable
class PropertyAccessBloc
    extends BaseBloc<PropertyAccessPageEvent, PropertyAccessPageState> {
    PropertyAccessBloc({
        required this.propertyAccessGetUnitsUseCase
}): super(PropertyAccessPageInitState()) {
        on<PropertyAccessGetUnitsEvent>((event, emit)=> _onPropertyAccessGetUnitEvent(event, emit));
    }

    final PropertyAccessGetUnitsUseCase propertyAccessGetUnitsUseCase;

    Future<void> _onPropertyAccessGetUnitEvent(
        PropertyAccessGetUnitsEvent event,
        Emitter<PropertyAccessPageState> emit
        )async{
        emit(PropertyAccessGetUnitsState(residenceUnits: state.residenceUnits)..dataState = DataState.loading);
        await propertyAccessGetUnitsUseCase.call(
            onSuccess: (model)=> emit(PropertyAccessGetUnitsState(residenceUnits: model)..dataState = DataState.success)
            ,
            onError: (error)=> emit(PropertyAccessGetUnitsState(residenceUnits: state.residenceUnits, errorCode: error!.errorCode ,  errorMessage: error!.message))
            ,params: PropertyAccessGetUnitsUseCaseParams(blockId: event.blockId));
    }


} 
