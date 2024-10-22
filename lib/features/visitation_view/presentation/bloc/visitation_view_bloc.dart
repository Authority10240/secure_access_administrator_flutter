import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:secure_access_administrator/core//base_classes/base_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_event.dart';
import 'package:secure_access_administrator/core/base_classes/base_side_effects.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access_administrator/features/visitation_view/data/models/visitation_view_model_response/visitation_view_load_visitation_model.dart';
import 'package:secure_access_administrator/features/visitation_view/domain/use_cases/visitation_view_usecase/visitation_view_load_visitation_usecase.dart';
import 'package:secure_access_administrator/features/visitation_view/domain/use_cases/visitation_view_usecase/visitation_view_load_visitation_vehicle_usecase.dart';
import 'package:secure_access_administrator/features/visitation_view/presentation/bloc/visitation_view_side_effect.dart';


part 'visitation_view_event.dart';
part 'visitation_view_state.dart';

@injectable
class VisitationViewBloc
    extends BaseBloc<VisitationViewPageEvent, VisitationViewPageState> {
    VisitationViewBloc({
        required this.visitationViewLoadVisitationUseCase,
        required this.viewLoadVisitationVehicleUseCase
}): super(VisitationViewPageInitState()) {
        on<VisitationViewLoadVisitationEvent>((event, emit)=>
        _onVisitationViewLoadVisitationEvent(event, emit));
        
        on<VisitationViewLoadVisitationVehicleEvent>((event, emit)=>
        _onVisitationViewLoadVisitationVehicleEvent(event,emit));
    }
    
    final VisitationViewLoadVisitationVehicleUseCase viewLoadVisitationVehicleUseCase;
    final VisitationViewLoadVisitationUseCase visitationViewLoadVisitationUseCase;
    
    
    Future<void> _onVisitationViewLoadVisitationEvent(
        VisitationViewLoadVisitationEvent event,
        Emitter<VisitationViewPageState> emit
        )async{
        
        emit(VisitationViewLoadVisitationState()..dataState = DataState.loading);
        await visitationViewLoadVisitationUseCase.call(
            onSuccess: (model){
                
                emit(VisitationViewLoadVisitationState(visitations: model)..dataState = DataState.success);
            }, onError: (error)=>emit(VisitationViewLoadVisitationState(
            errorCode: error!.errorCode, 
            errorMessage: error.message)..dataState = DataState.error),
        params: VisitationViewLoadVisitationUseCaseParams(date: event.date));
        
    }
    
    Future<void> _onVisitationViewLoadVisitationVehicleEvent(
        VisitationViewLoadVisitationVehicleEvent event,
        Emitter<VisitationViewPageState> emit
        )async{
        emitSideEffect(VisitationViewLoadVisitationVehicleSideEffect()..effectState = EffectState.loading );
        await viewLoadVisitationVehicleUseCase.call(
            onSuccess: (model)=> emitSideEffect(VisitationViewLoadVisitationVehicleSideEffect(
                visitationViewLoadVisitationModel: event.visitationViewLoadVisitationModel,
            visitationViewLoadVisitationVehicleModel: model)..effectState = EffectState.success), 
            onError: (error)=> emitSideEffect(VisitationViewLoadVisitationVehicleSideEffect(errorMessage: error!.message, errorCode: error.errorCode)));
        
    }
} 
