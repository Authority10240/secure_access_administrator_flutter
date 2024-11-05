import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:secure_access_administrator/core/base_classes/base_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_event.dart';
import 'package:secure_access_administrator/core/base_classes/base_side_effects.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access_administrator/features/visitation_search/domain/use_cases/visitation_search_usecase/visitation_search_load_vehicle_usecase.dart';
import 'package:secure_access_administrator/features/visitation_search/domain/use_cases/visitation_search_usecase/visitation_search_value_changed_usecase.dart';
import 'package:secure_access_administrator/features/visitation_search/presentation/modal/visitation_search_criteria.dart';

part 'visitation_search_event.dart';
part 'visitation_search_state.dart';
part 'visitation_search_side_effect.dart';

@injectable
class VisitationSearchBloc
    extends BaseBloc<VisitationSearchPageEvent, VisitationSearchPageState>
with BlocSideEffectMixin<VisitationSearchPageEvent, VisitationSearchPageState, VisitationSearchSideEffect>{
    VisitationSearchBloc({
        required this.visitationSearchLoadVehicleUseCase,
        required this.valueChangedUseCase}) : super(VisitationSearchPageInitState(personnelDrawerOpen: false, carDrawerOpen: false, dateDrawerOpen: false)) {
        on<VisitationSearchOpenDrawerEvent>((event, emit) =>
            _onVisitationSearchOpenDrawer(event, emit));

        on<VisitationSearchLoadVehicleEvent>((event, emit)=> _onVisitationSearchLoadVehicleEvent(event, emit));

        on<VisitationSearchLoadVisitationEvent>((event, emit)=> _onVisitationSearchLoadVisitationEvent(event,emit));
    }

    final VisitationSearchValueChangedUseCase valueChangedUseCase;
    final VisitationSearchLoadVehicleUseCase visitationSearchLoadVehicleUseCase;

    Future<void> _onVisitationSearchLoadVehicleEvent(
        VisitationSearchLoadVehicleEvent event,
        Emitter<VisitationSearchPageState> emit
        )async{
        emitSideEffect(VisitationSearchLoadVehicleSideEffect()..effectState = EffectState.loading);
        await visitationSearchLoadVehicleUseCase.call(
            onSuccess: (model)=> emitSideEffect(VisitationSearchLoadVehicleSideEffect
                (dashboardGetVisitationsModel: event.dashboardGetVisitationsModel,
            dashboardPageLoadVisitationsVehicleModel: model)..effectState = EffectState.success),
            onError: (error)=> emitSideEffect(VisitationSearchLoadVehicleSideEffect(
                errorMessage: error!.message,
                errorCode:  error.errorCode
            )..effectState = EffectState.error),
        params: VisitationSearchLoadVehicleUseCaseParams(
            date: event.dashboardGetVisitationsModel.date!,
            visitationId: event.visitationId));


    }

    Future<void> _onVisitationSearchLoadVisitationEvent(
        VisitationSearchLoadVisitationEvent event,
        Emitter<VisitationSearchPageState> emit
        )async{
        emit(VisitationSearchLoadVisitationState(
            personnelDrawerOpen:  state.personnelDrawerOpen,
            carDrawerOpen: state.carDrawerOpen,
            dateDrawerOpen:  state.dateDrawerOpen,
            visitations: state.visitations
        )..dataState = DataState.loading);

        await valueChangedUseCase.call(onSuccess: (stream){
            emit(VisitationSearchLoadVisitationState(
                personnelDrawerOpen:  state.personnelDrawerOpen,
                carDrawerOpen: state.carDrawerOpen,
                dateDrawerOpen:  state.dateDrawerOpen,
                visitations: stream??state.visitations
            )..dataState = DataState.success);

        }, onError: (error){
            emit(VisitationSearchLoadVisitationState(
                personnelDrawerOpen:  state.personnelDrawerOpen,
                carDrawerOpen: state.carDrawerOpen,
                dateDrawerOpen:  state.dateDrawerOpen,
                visitations: state.visitations,
                errorCode: error!.errorCode,
                errorMessage: error.message

            )..dataState = DataState.error);
        },params: VisitationSearchValueChangedUseCaseParams(visitationSearchCriteria: event.visitationSearchCriteria));

    }
    Future<void> _onVisitationSearchOpenDrawer(
        VisitationSearchOpenDrawerEvent event,
        Emitter<VisitationSearchPageState> emit
        )async{
        emit(VisitationSearchOpenDrawerState(
            personnelDrawerOpen: event.personnelDrawerOpen?? state.personnelDrawerOpen,
            carDrawerOpen: event.carDrawerOpen?? state.carDrawerOpen,
            dateDrawerOpen: event.dateDrawerOpen?? state.dateDrawerOpen,
            visitations: state.visitations
        )..dataState = DataState.loading);
        emit(VisitationSearchOpenDrawerState(
            personnelDrawerOpen: event.personnelDrawerOpen?? state.personnelDrawerOpen,
            carDrawerOpen: event.carDrawerOpen?? state.carDrawerOpen,
            dateDrawerOpen: event.dateDrawerOpen?? state.dateDrawerOpen,
            visitations: state.visitations
        )..dataState = DataState.success);
    }

}
