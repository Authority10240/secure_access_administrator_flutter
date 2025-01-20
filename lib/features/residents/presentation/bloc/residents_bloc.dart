

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_event.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';
import 'package:secure_access_administrator/features/residents/domain/use_cases/residents_usecase/property_access_add_resident_usecase.dart';
import 'package:secure_access_administrator/features/residents/domain/use_cases/residents_usecase/property_access_get_resident_usecase.dart';
import 'package:secure_access_repository/models/secure_access_resident_model/secure_access_resident_model.dart';

part 'residents_event.dart';
part 'residents_state.dart';

@injectable
class ResidentsBloc
    extends BaseBloc<ResidentsPageEvent, ResidentsPageState> {
    ResidentsBloc({
        required this.propertyAccessAddResidentUseCase,
        required this.propertyAccessGetresidentUseCase}): super(ResidentsPageInitState()) {
        on<PropertyAccessGetResidentsEvent>((event, emit)=> _onPropertyAccessGetResidentsEvent(event, emit));
        on<AddResidentClickedEvent>((event, emit)=> _onAddResidentClickedEvent(event, emit));
    }

    final PropertyAccessGetresidentUseCase propertyAccessGetresidentUseCase;
    final PropertyAccessAddResidentUseCase propertyAccessAddResidentUseCase;

    Future<void>_onPropertyAccessGetResidentsEvent(
        PropertyAccessGetResidentsEvent event,
        Emitter<ResidentsPageState> emit
        )async{
        emit(PropertyAccessGetResidentsState(
            residenceResidents: state.residenceResidents)..dataState = DataState.loading );
        await propertyAccessGetresidentUseCase.call(
            params: PropertyAccessGetresidentUseCaseParams(
                blockId: event.blockId,
                unitId: event.unitId),
            onSuccess: (model)=> emit(PropertyAccessGetResidentsState
                (residenceResidents: model)..dataState = DataState.success),
            onError: (error)=> emit(PropertyAccessGetResidentsState(
                residenceResidents: state.residenceResidents,
                errorMessage: error!.message,
                errorCode: error!.errorCode)..dataState = DataState.error));
    }

    Future<void>_onAddResidentClickedEvent(
        AddResidentClickedEvent event,
        Emitter<ResidentsPageState> emit
        )async{
        emit(AddResidentClickedState(residenceResidents: state.residenceResidents)..dataState = DataState.loading);
        await propertyAccessAddResidentUseCase.call(
            params: PropertyAccessAddResidentUseCaseParams(
                secureAccessResidentModel: event.secureAccessResidentModel,
                blockId: event.blockId,
                unitsId: event.unitId),
            onSuccess: (model)=> emit(AddResidentClickedState(residenceResidents: state.residenceResidents)..dataState = DataState.success)
            , onError: (error)=> emit(AddResidentClickedState(residenceResidents: state.residenceResidents, errorCode: error!.errorCode, errorMessage: error!.message)));
    }
} 
