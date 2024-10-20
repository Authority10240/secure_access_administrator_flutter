import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_event.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_vistations_model.dart';
import 'package:secure_access_administrator/features/dashboard/domain/use_cases/dashboard_usecase/dashboard_page_load_visitation_vehicle_usecase.dart';
import 'package:secure_access_administrator/features/dashboard/domain/use_cases/dashboard_usecase/dashboard_page_load_visitations_usecase.dart';


part 'dashboard_event.dart';
part 'dashboard_state.dart';

@injectable
class DashboardBloc
    extends BaseBloc<DashboardPageEvent, DashboardPageState> {
    DashboardBloc({
        required this.dashboardPageLoadVisitationVehicleUseCase,
        required this.dashboardPageLoadVisitationsUseCase}) : super(DashboardPageInitState()) {
        on<DashBoardPageSwitchEvent>((event, state) =>
            _onDashBoardPageSwitchEvent(event, state));
        on<DashBoardPageVisitationEvent>((event, state) =>
            _onDashBoardPageVisitationEvent(event, state));
        on<DashBoardPageLoadVisitationVehicleEvent>((event, state)=>
            _onDashBoardPageLoadVisitationVehicleEvent(event, state));
    }

    final DashboardPageLoadVisitationsUseCase dashboardPageLoadVisitationsUseCase;
    final DashboardPageLoadVisitationVehicleUseCase dashboardPageLoadVisitationVehicleUseCase;

    Future<void> _onDashBoardPageLoadVisitationVehicleEvent(
        DashBoardPageLoadVisitationVehicleEvent event,
        Emitter<DashboardPageState> emit
        )async{
        emit(DashBoardPageLoadVisitationVehicleState(visitations: state.visitations)..dataState = DataState.loading);
        await dashboardPageLoadVisitationVehicleUseCase.call(
            onSuccess: (model){
                emit(DashBoardPageLoadVisitationVehicleState(
                    dashboardPageLoadVisitationsModel: event.dashboardPageLoadVisitationsModel,
                dashboardPageLoadVisitationsVehicleModel: model,
                    visitations:state.visitations,
                )..dataState = DataState.success);

            }, onError: (error){
            emit(DashBoardPageLoadVisitationVehicleState(
                visitations: state.visitations,
                errorCode: error!.errorCode,
                errorMessage: error!.message
            )..dataState = DataState.error);

        },
        params: DashboardPageLoadVisitationVehicleUseCaseParams(visitationId: event.visitationId));
    }


    Future<void> _onDashBoardPageVisitationEvent(
        DashBoardPageVisitationEvent event,
        Emitter<DashboardPageState> emit) async {
        emit(DashBoardPageVisitationState()..dataState =DataState.loading );
        await dashboardPageLoadVisitationsUseCase.call(
            onSuccess: (model){
                emit(DashBoardPageVisitationState(visitations: model)..dataState =DataState.success );

            }, onError: (error){
            emit(DashBoardPageVisitationState(
                errorMessage: error!.message,
            errorCode: error!.errorCode)..dataState =DataState.error );

        });

    }

    Future<void> _onDashBoardPageSwitchEvent(DashBoardPageSwitchEvent event,
        Emitter<DashboardPageState> emit) async {
        if (event.pageState is DashBoardPageVisitationState ||
            event.pageState is DashboardPageInitState) {
            emit(DashBoardPageLogsState(
                visitations: state.visitations)
                ..dataState = DataState.success);
        } else {
            emit(DashBoardPageVisitationState(
                visitations: state.visitations)
                ..dataState = DataState.success);
        }
    }

}