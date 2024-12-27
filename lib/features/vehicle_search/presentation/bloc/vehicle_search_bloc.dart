
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access_administrator/core/base_classes/base_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_event.dart';
import 'package:secure_access_administrator/core/base_classes/base_side_effects.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';
import 'package:secure_access_administrator/features/vehicle_search/domain/use_cases/vehicle_search_usecase/vehicle_search_load-visitation_usecase.dart';
import 'package:secure_access_administrator/features/vehicle_search/domain/use_cases/vehicle_search_usecase/vehicle_search_value_changed_usecase.dart';
import 'package:secure_access_administrator/features/vehicle_search/presentation/bloc/vehicle_search_side_effect.dart';
import 'package:secure_access_administrator/features/vehicle_search/presentation/modal/vehicle_search_criteria.dart';
import 'package:secure_access_repository/models/secure_access_visitations_vehicle_model/secure_access_visitations_vehicle_model.dart';


part 'vehicle_search_event.dart';
part 'vehicle_search_state.dart';

@injectable
class VehicleSearchBloc
    extends BaseBloc<VehicleSearchPageEvent, VehicleSearchPageState>
    with BlocSideEffectMixin<VehicleSearchPageEvent, VehicleSearchPageState, VehicleSearchSideEffect>{
    VehicleSearchBloc({
        required this.vehicleSearchLoadVisitationUseCase,
        required this.vehicleSearchValueChangedUseCase
}): super(VehicleSearchPageInitState(carDrawerOpen: false, dateDrawerOpen: false)) {

        on<VehicleSearchValueChangedEvent>((event, state)=> _onVehicleSearchValueChangedEvent(event, state));
        on<VehicleSearchOpenDrawerEvent>((event ,state)=> _onVehicleSearchOpenDrawerEvent(event, state));
        on<VehicleSearchLoadVisitationEvent>((event, state)=> _onVehicleSearchLoadVisitationEvent(event, state));
    }

    final VehicleSearchLoadVisitationUseCase vehicleSearchLoadVisitationUseCase;
    final VehicleSearchValueChangedUseCase vehicleSearchValueChangedUseCase;

    Future<void> _onVehicleSearchLoadVisitationEvent(
        VehicleSearchLoadVisitationEvent event,
        Emitter<VehicleSearchPageState> emit
        )async{
            emitSideEffect(VehicleSearchLoadVisitationSideEffect()..effectState = EffectState.loading);
        await vehicleSearchLoadVisitationUseCase.call(onSuccess: (model){
            emitSideEffect(VehicleSearchLoadVisitationSideEffect(dashboardPageLoadVisitationsVehicleModel: event.dashboardPageLoadVisitationsVehicleModel,
            dashboardGetVisitationsModel: model!)..effectState = EffectState.success);

        }, onError: (error){
            emitSideEffect(VehicleSearchLoadVisitationSideEffect(
                errorMessage: error!.message,
                errorCode: error.errorCode
            )..effectState = EffectState.error);

        },
        params: VehicleSearchLoadVisitationUseCaseParams(visitationid: event.dashboardPageLoadVisitationsVehicleModel.identificationNumber!));
    }

    Future<void> _onVehicleSearchValueChangedEvent(
       VehicleSearchValueChangedEvent event,
        Emitter<VehicleSearchPageState> emit
        )async{
        emit( VehicleSearchValueChangedState(visitations: state.visitations,dateDrawerOpen: state.dateDrawerOpen, carDrawerOpen: state.carDrawerOpen)..dataState = DataState.loading);
        await vehicleSearchValueChangedUseCase.call(onSuccess: (model){
            emit( VehicleSearchValueChangedState(
                visitations: model,
                dateDrawerOpen: state.dateDrawerOpen,
                carDrawerOpen: state.carDrawerOpen)..dataState = DataState.success);
        }, onError: (error){
            emit( VehicleSearchValueChangedState
                (visitations: state.visitations,
                errorCode:  error!.errorCode,
                errorMessage: error.message,
                dateDrawerOpen: state.dateDrawerOpen,
                carDrawerOpen: state.carDrawerOpen)..dataState = DataState.error);
        },
        params: VehicleSearchValueChangedUseCaseParams(vehicleSearchCriteria: event.vehicleSearchCriteria) );
    }

    Future<void> _onVehicleSearchOpenDrawerEvent(
        VehicleSearchOpenDrawerEvent event,
        Emitter<VehicleSearchPageState> emit
        )async{
        emit(VehicleSearchOpenDrawerState(
            dateDrawerOpen: event.dateDrawerOpen?? state.dateDrawerOpen,
            carDrawerOpen: event.carDrawerOpen?? state.carDrawerOpen,
        visitations: state.visitations)..dataState = DataState.loading);
        emit(VehicleSearchOpenDrawerState(
            dateDrawerOpen: event.dateDrawerOpen?? state.dateDrawerOpen,
            carDrawerOpen: event.carDrawerOpen?? state.carDrawerOpen,
            visitations: state.visitations)..dataState = DataState.success);
    }
} 
