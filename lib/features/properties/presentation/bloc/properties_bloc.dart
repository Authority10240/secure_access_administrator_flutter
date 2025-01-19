

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:injectable/injectable.dart';
import 'package:secure_access_administrator/core/base_classes/base_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_event.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';
import 'package:secure_access_administrator/features/properties/domain/use_cases/properties_usecase/properties_add_block_clicked_usecase.dart';
import 'package:secure_access_administrator/features/properties/domain/use_cases/properties_usecase/properties_delete_block_usecase.dart';
import 'package:secure_access_administrator/features/properties/domain/use_cases/properties_usecase/properties_get_blocks_usecase.dart';
import 'package:secure_access_repository/models/secure_access_block_model/secure_access_blocks_model.dart';

part 'properties_event.dart';
part 'properties_state.dart';

@injectable
class PropertiesBloc
    extends BaseBloc<PropertiesPageEvent, PropertiesPageState> {
    PropertiesBloc({
        required this.propertiesAddBlockClickedUseCase,
        required this.propertiesGetBlocksUseCase,
    required this.propertiesDeleteBlockUseCase}): super(PropertiesPageInitState()) {
        on<PropertiesAddBlockClickedEvent>((event, emit)=> onPropertiesAddBlockClickedEvent(event, emit));
        on<PropertiesGetBlocksEvent>((event, emit)=> onPropertiesGetBlockEvent(event, emit));
        on<PropertiesDeleteBlockEvent>((event, emit)=> onPropertiesDeleteBlockEvent(event, emit));
    }

    final PropertiesAddBlockClickedUseCase propertiesAddBlockClickedUseCase;
    final PropertiesGetBlocksUseCase propertiesGetBlocksUseCase;
    final PropertiesDeleteBlockUseCase propertiesDeleteBlockUseCase;


    Future<void> onPropertiesAddBlockClickedEvent(
        PropertiesAddBlockClickedEvent event,
        Emitter<PropertiesPageState> emit
        )async{
        emit(PropertiesAddBlockClickedState(residenceBlock: state.residenceBlock)..dataState = DataState.loading);
        propertiesAddBlockClickedUseCase.call(
            onSuccess: (model)=> emit(PropertiesAddBlockClickedState(residenceBlock: state.residenceBlock)..dataState = DataState.success),
            onError: (error)=> emit(PropertiesAddBlockClickedState(residenceBlock: state.residenceBlock, errorCode: error!.errorCode, errorMessage: error!.message)..dataState = DataState.error),
            params: PropertiesAddBlockClickedUseCaseParams(secureAccessBlocksModel: event.secureAccessBlocksModel));
    }

    Future<void> onPropertiesGetBlockEvent(
    PropertiesGetBlocksEvent propertiesGetBlockEvent,
    Emitter<PropertiesPageState> emit)async{
        emit(PropertiesGetBlocksState(residenceBlock: state.residenceBlock)..dataState = DataState.loading);
       await propertiesGetBlocksUseCase.call(
            onSuccess: (model)=> emit(PropertiesGetBlocksState(residenceBlock: model)..dataState = DataState.success),
            onError: (error)=> emit(PropertiesGetBlocksState(residenceBlock: state.residenceBlock, errorMessage: error!.message, errorCode: error!.errorCode)..dataState = DataState.error),
        );
    }

    Future<void>onPropertiesDeleteBlockEvent(
        PropertiesDeleteBlockEvent event,
        Emitter<PropertiesPageState> emit
        )async{
      emit(PropertiesDeleteBlockState(residenceBlock: state.residenceBlock)..dataState = DataState.loading);
      propertiesDeleteBlockUseCase.call(
          onSuccess: (success)=> emit(PropertiesDeleteBlockState(residenceBlock: state.residenceBlock)..dataState = DataState.success),
          onError: (error)=> emit(PropertiesDeleteBlockState(residenceBlock: state.residenceBlock, errorMessage: state.errorMessage, errorCode:  state.errorCode)..dataState = DataState.error),
      params: PropertiesDeleteBlockUseCaseParams(blockId: event.blockid));
    }




} 
