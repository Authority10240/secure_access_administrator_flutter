import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:secure_access_administrator/core/base_classes/base_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_event.dart';
import 'package:secure_access_administrator/core/base_classes/base_side_effects.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access_administrator/core/extensions/date_extension.dart';
import 'package:intl/intl.dart';
import 'package:secure_access_administrator/core/failures/runtime_exception.dart';
import 'package:secure_access_administrator/features/dashboard/data/models/dashboard_model_response/dashboard_get_visitations_model.dart';
import 'package:secure_access_administrator/features/dashboard/domain/use_cases/dashboard_usecase/dashboard_get_visitations_usecase.dart';
import 'package:secure_access_administrator/features/dashboard/domain/use_cases/dashboard_usecase/dashboard_page_load_visitation_vehicle_usecase.dart';
import 'package:secure_access_administrator/features/dashboard/presentation/bloc/dashboard_side_effects.dart';


part 'dashboard_event.dart';
part 'dashboard_state.dart';

@injectable
class DashboardBloc
    extends BaseBloc<DashboardPageEvent, DashboardPageState>
    with BlocSideEffectMixin<DashboardPageEvent, DashboardPageState, DashboardPageSideEffect> {
    DashboardBloc({
        required this.get2DaysBackVisitations,
        required this.get3DaysBackVisitations,
        required this.get4DaysBackVisitations,
        required this.get5DaysBackVisitations,
        required this.get6DaysBackVisitations,
        required this.getTodaysVisitations,
        required this.getYesterdaysVisitations,
        required this.getCalenderDateVisitations,
        required this.dashboardPageLoadVisitationVehicleUseCase
}) : super(DashboardPageInitState()) {
        on<DashBoardGetVisitationEvent>((event, emit)=> _onDashboardGetVisitations(event,emit));
        on<DashBoardPageLoadVisitationVehicleEvent>((event, state)=>
            _onDashBoardPageLoadVisitationVehicleEvent(event, state));
    }

    final DashboardGetVisitationsUseCase getTodaysVisitations;
    final DashboardGetVisitationsUseCase getYesterdaysVisitations;
    final DashboardGetVisitationsUseCase get2DaysBackVisitations;
    final DashboardGetVisitationsUseCase get3DaysBackVisitations;
    final DashboardGetVisitationsUseCase get4DaysBackVisitations;
    final DashboardGetVisitationsUseCase get5DaysBackVisitations;
    final DashboardGetVisitationsUseCase get6DaysBackVisitations;
    final DashboardGetVisitationsUseCase getCalenderDateVisitations;
    final DashboardPageLoadVisitationVehicleUseCase dashboardPageLoadVisitationVehicleUseCase;

    Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? todaysVisitations;
    Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? yesterdaysVisitations;
    Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? twoDaysBackVisitations;
    Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? threeDaysBackVisitations;
    Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? fourDaysBackVisitations;
    Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? fiveDaysBackVisitations;
    Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? sixDaysBackVisitations;
    Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? calenderDayVisitations;

    DateTime currentDate = DateTime.now();
    DateTime currentDate2 = DateTime.now();
    String currentMonth = DateFormat('yMMM','en_us').format(DateTime.now());
    DateTime targetDateTime = DateTime.now();


    Future<void> _onDashboardGetVisitations(
        DashBoardGetVisitationEvent event,
        Emitter<DashboardPageState> emit
        )async{
        try {
            // get calender dat visitations
            await getCalenderDateVisitations.call(
                onSuccess: (model) =>
                calenderDayVisitations = model,
                onError: (error) => throw RuntimeException(errorCode: error!.errorCode!, message: error.message!),
                params: DashboardGetVisitationsUseCaseParams(
                    date: DateTime.now().toString().toFormattedDate()));

            // gets todays visitations
            await getTodaysVisitations.call(
                onSuccess: (model) => todaysVisitations = model,
                onError: (error) => throw RuntimeException(errorCode: error!.errorCode!, message: error.message!),
                params: DashboardGetVisitationsUseCaseParams(
                    date: DateTime.now().toString().toFormattedDate()));

            // get yesterdays values
            await getYesterdaysVisitations.call(
                onSuccess: (model) => yesterdaysVisitations = model,
                onError: (error) => throw RuntimeException(errorCode: error!.errorCode!, message: error.message!),
                params: DashboardGetVisitationsUseCaseParams(
                    date: DateTime.now().subtract(const Duration(days: 1)).toString().toFormattedDate()));

            // get 2 days back values
            await get2DaysBackVisitations.call(
                onSuccess: (model) => twoDaysBackVisitations = model,
                onError: (error) => throw RuntimeException(errorCode: error!.errorCode!, message: error.message!),
                params: DashboardGetVisitationsUseCaseParams(
                    date: DateTime.now().subtract(const Duration(days: 2)).toString().toFormattedDate()));


            // get 3 days back values
            await get3DaysBackVisitations.call(
                onSuccess: (model) => threeDaysBackVisitations = model,
                onError: (error) => throw RuntimeException(errorCode: error!.errorCode!, message: error.message!),
                params: DashboardGetVisitationsUseCaseParams(
                    date: DateTime.now().subtract(const Duration(days: 3)).toString().toFormattedDate()));


            // get 4 days back values
            await get4DaysBackVisitations.call(
                onSuccess: (model) => fourDaysBackVisitations = model,
                onError: (error) => throw RuntimeException(errorCode: error!.errorCode!, message: error.message!),
                params: DashboardGetVisitationsUseCaseParams(
                    date: DateTime.now().subtract(const Duration(days: 4)).toString().toFormattedDate()));

            // get 5 days back values
            await get5DaysBackVisitations.call(
                onSuccess: (model) => fiveDaysBackVisitations = model,
                onError: (error) => throw RuntimeException(errorCode: error!.errorCode!, message: error.message!),
                params: DashboardGetVisitationsUseCaseParams(
                    date: DateTime.now().subtract(const Duration(days: 5)).toString().toFormattedDate()));

            // get 6 days back values
            await get6DaysBackVisitations.call(
                onSuccess: (model) =>
                    emit(DashboardPageGetVisitationState(
                        fiveDaysBackVisitations: fiveDaysBackVisitations,
                        fourDaysBackVisitations: fourDaysBackVisitations,
                        sixDaysBackVisitations: model,
                        threeDaysBackVisitations: threeDaysBackVisitations,
                        todaysVisitations: todaysVisitations,
                        twoDaysBackVisitations: twoDaysBackVisitations,
                        yesterdaysVisitations: yesterdaysVisitations,
                        calenderDayVisitations: calenderDayVisitations
                    )
                        ..dataState = DataState.success),
                onError: (error) => throw RuntimeException(errorCode: error!.errorCode!, message: error.message!),
                params: DashboardGetVisitationsUseCaseParams(
                    date: DateTime.now().subtract(const Duration(days: 6)).toString().toFormattedDate()));


        }on RuntimeException catch(error){
        emit(DashboardPageGetVisitationState(
        errorMessage: error!.message,
        errorCode: error!.errorCode));
        }

    }


    Future<void> _onDashBoardPageLoadVisitationVehicleEvent(
        DashBoardPageLoadVisitationVehicleEvent event,
        Emitter<DashboardPageState> emit
        )async{
        emitSideEffect(DashBoardPageLoadVisitationVehicleSideEffect()..effectState = EffectState.loading );
        await dashboardPageLoadVisitationVehicleUseCase.call(
            onSuccess: (model){
                emitSideEffect(DashBoardPageLoadVisitationVehicleSideEffect(
                    dashboardPageLoadVisitationsVehicleModel: model,
                    dashboardGetVisitationsModel: event.dashboardGetVisitationsModel
                )..effectState = EffectState.success);

            }, onError: (error){
            emitSideEffect(DashBoardPageLoadVisitationVehicleSideEffect(
                errorCode: error!.errorCode,
                errorMessage: error!.message
            )..effectState = EffectState.error);

        },
            params: DashboardPageLoadVisitationVehicleUseCaseParams(
                visitationId: event.visitationId,
                date: event.dashboardGetVisitationsModel.date! ));
    }




}