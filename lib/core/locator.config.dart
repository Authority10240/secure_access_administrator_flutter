// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/burger_menu/presentation/bloc/burger_menu_bloc.dart'
    as _i850;
import '../features/dashboard/data/data_source/remote/dashboard_service.dart'
    as _i274;
import '../features/dashboard/data/data_source/remote/dashboard_service_impl.dart'
    as _i83;
import '../features/dashboard/data/repository_impl/dashboard_repository_impl/dashboard_get_visitations_repository_impl.dart'
    as _i351;
import '../features/dashboard/data/repository_impl/dashboard_repository_impl/dashboard_page_load_visitation_vehicle_repository_impl.dart'
    as _i673;
import '../features/dashboard/domain/repository/dashboard_repository/dashboard_get_visitations_repository.dart'
    as _i262;
import '../features/dashboard/domain/repository/dashboard_repository/dashboard_page_load_visitation_vehicle_repository.dart'
    as _i261;
import '../features/dashboard/domain/use_cases/dashboard_usecase/dashboard_get_visitations_usecase.dart'
    as _i591;
import '../features/dashboard/domain/use_cases/dashboard_usecase/dashboard_page_load_visitation_vehicle_usecase.dart'
    as _i546;
import '../features/dashboard/presentation/bloc/dashboard_bloc.dart' as _i356;
import '../features/login/data/data_source/local/hive/biometrics_local_storage/model/biometrics_local_model.dart'
    as _i822;
import '../features/login/data/data_source/local/hive/sign_in_local_storage/sign_in_local_model.dart'
    as _i597;
import '../features/login/data/data_source/remote/sign_in_service.dart'
    as _i1054;
import '../features/login/data/data_source/remote/sign_in_service_impl.dart'
    as _i926;
import '../features/login/data/repository_impl/login_repository_impl/sign_in_clicked_repository_impl.dart'
    as _i673;
import '../features/login/domain/repository/login_repository/sign_in_clicked_repository.dart'
    as _i171;
import '../features/login/domain/use_cases/login_usecase/sign_in_clicked_usecase.dart'
    as _i845;
import '../features/login/presentation/bloc/login_bloc.dart' as _i1022;
import '../features/properties/data/data_source/properties_remote_data_source.dart'
    as _i554;
import '../features/properties/data/data_source/properties_remote_data_source_impl.dart'
    as _i427;
import '../features/properties/data/repository_impl/properties_repository_impl/properties_add_block_clicked_repository_impl.dart'
    as _i498;
import '../features/properties/data/repository_impl/properties_repository_impl/properties_delete_block_repository_impl.dart'
    as _i640;
import '../features/properties/data/repository_impl/properties_repository_impl/properties_get_blocks_repository_impl.dart'
    as _i375;
import '../features/properties/domain/repository/properties_repository/properties_add_block_clicked_repository.dart'
    as _i142;
import '../features/properties/domain/repository/properties_repository/properties_delete_block_repository.dart'
    as _i472;
import '../features/properties/domain/repository/properties_repository/properties_get_blocks_repository.dart'
    as _i1042;
import '../features/properties/domain/use_cases/properties_usecase/properties_add_block_clicked_usecase.dart'
    as _i403;
import '../features/properties/domain/use_cases/properties_usecase/properties_delete_block_usecase.dart'
    as _i888;
import '../features/properties/domain/use_cases/properties_usecase/properties_get_blocks_usecase.dart'
    as _i790;
import '../features/properties/presentation/bloc/properties_bloc.dart' as _i304;
import '../features/property_access/data/data_source/remote/property_access_remote_data_source.dart'
    as _i329;
import '../features/property_access/data/data_source/remote/property_access_remote_data_source_impl.dart'
    as _i696;
import '../features/property_access/data/repository_impl/property_access_repository_impl/property_access_add_unit_repository_impl.dart'
    as _i313;
import '../features/property_access/data/repository_impl/property_access_repository_impl/property_access_delete_unit_repository_impl.dart'
    as _i989;
import '../features/property_access/data/repository_impl/property_access_repository_impl/property_access_get_units_repository_impl.dart'
    as _i262;
import '../features/property_access/domain/repository/property_access_repository/property_access_add_unit_repository.dart'
    as _i512;
import '../features/property_access/domain/repository/property_access_repository/property_access_delete_unit_repository.dart'
    as _i844;
import '../features/property_access/domain/repository/property_access_repository/property_access_get_units_repository.dart'
    as _i477;
import '../features/property_access/domain/use_cases/property_access_usecase/property_access_add_unit_usecase.dart'
    as _i944;
import '../features/property_access/domain/use_cases/property_access_usecase/property_access_delete_unit_usecase.dart'
    as _i12;
import '../features/property_access/domain/use_cases/property_access_usecase/property_access_get_units_usecase.dart'
    as _i892;
import '../features/property_access/presentation/bloc/property_access_bloc.dart'
    as _i796;
import '../features/residents/data/data_source/remote/residents_remote_data_source.dart'
    as _i70;
import '../features/residents/data/data_source/remote/residents_remote_data_source_impl.dart'
    as _i875;
import '../features/residents/data/repository_impl/residents_repository_impl/property_access_add_resident_repository_impl.dart'
    as _i673;
import '../features/residents/data/repository_impl/residents_repository_impl/property_access_get_resident_repository_impl.dart'
    as _i696;
import '../features/residents/domain/repository/residents_repository/property_access_add_resident_repository.dart'
    as _i806;
import '../features/residents/domain/repository/residents_repository/property_access_get_resident_repository.dart'
    as _i785;
import '../features/residents/domain/use_cases/residents_usecase/property_access_add_resident_usecase.dart'
    as _i571;
import '../features/residents/domain/use_cases/residents_usecase/property_access_get_resident_usecase.dart'
    as _i298;
import '../features/residents/presentation/bloc/residents_bloc.dart' as _i996;
import '../features/vehicle_search/data/data_source/remote/vehicle_search_data_source.dart'
    as _i74;
import '../features/vehicle_search/data/data_source/remote/vehicle_search_data_source_impl.dart'
    as _i645;
import '../features/vehicle_search/data/repository_impl/vehicle_search_repository_impl/vehicle_search_load-visitation_repository_impl.dart'
    as _i456;
import '../features/vehicle_search/data/repository_impl/vehicle_search_repository_impl/vehicle_search_value_changed_repository_impl.dart'
    as _i274;
import '../features/vehicle_search/domain/repository/vehicle_search_repository/vehicle_search_load_visitation_repository.dart'
    as _i532;
import '../features/vehicle_search/domain/repository/vehicle_search_repository/vehicle_search_value_changed_repository.dart'
    as _i1017;
import '../features/vehicle_search/domain/use_cases/vehicle_search_usecase/vehicle_search_load-visitation_usecase.dart'
    as _i950;
import '../features/vehicle_search/domain/use_cases/vehicle_search_usecase/vehicle_search_value_changed_usecase.dart'
    as _i165;
import '../features/vehicle_search/presentation/bloc/vehicle_search_bloc.dart'
    as _i545;
import '../features/visitation_search/data/data_source/remote/visitation_search_remote_data_source.dart'
    as _i1059;
import '../features/visitation_search/data/data_source/remote/visitation_search_remote_data_srource_impl.dart'
    as _i646;
import '../features/visitation_search/data/repository_impl/visitation_search_repository_impl/visitation_search_load_vehicle_repository_impl.dart'
    as _i480;
import '../features/visitation_search/data/repository_impl/visitation_search_repository_impl/visitation_search_value_changed_repository_impl.dart'
    as _i583;
import '../features/visitation_search/domain/repository/visitation_search_repository/visitation_search_load_vehicle_repository.dart'
    as _i705;
import '../features/visitation_search/domain/repository/visitation_search_repository/visitation_search_value_changed_repository.dart'
    as _i729;
import '../features/visitation_search/domain/use_cases/visitation_search_usecase/visitation_search_load_vehicle_usecase.dart'
    as _i340;
import '../features/visitation_search/domain/use_cases/visitation_search_usecase/visitation_search_value_changed_usecase.dart'
    as _i500;
import '../features/visitation_search/presentation/bloc/visitation_search_bloc.dart'
    as _i486;
import '../generated/l10n.dart' as _i504;
import 'locator.dart' as _i775;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    gh.factory<_i361.Dio>(() => registerModules.dio);
    gh.factory<_i504.AppLocalizations>(() => registerModules.appLocalizations);
    gh.factory<_i59.FirebaseAuth>(() => registerModules.firebaseAuth);
    gh.factory<_i850.BurgerMenuBloc>(() => _i850.BurgerMenuBloc());
    gh.factory<_i822.BiometricsLocalModel>(
        () => _i822.BiometricsLocalModel(enabled: gh<bool>()));
    gh.singleton<_i329.PropertyAccessRemoteDataSource>(
        () => _i696.PropertyAccessRemoteDataSourceImpl());
    gh.factory<_i597.SignInLocalModel>(
        () => _i597.SignInLocalModel(signedIn: gh<bool>()));
    gh.singleton<_i70.ResidentRemoteDataSource>(
        () => _i875.ResidentsRemoteDataSourceImpl());
    gh.singleton<_i1059.VisitationSearchRemoteDataSource>(
        () => _i646.VisitationSearchRemotedataSourceImple());
    gh.factory<_i705.VisitationSearchLoadVehicleRepository>(() =>
        _i480.VisitationSearchLoadVehicleRepositoryImpl(
            visitationSearchRemoteDataSource:
                gh<_i1059.VisitationSearchRemoteDataSource>()));
    gh.factory<_i806.PropertyAccessAddResidentRepository>(() =>
        _i673.PropertyAccessAddResidentRepositoryImpl(
            residentRemoteDataSource: gh<_i70.ResidentRemoteDataSource>()));
    gh.factory<_i477.PropertyAccessGetUnitsRepository>(() =>
        _i262.PropertyAccessGetUnitsRepositoryImpl(
            propertyAccessRemoteDataSource:
                gh<_i329.PropertyAccessRemoteDataSource>()));
    gh.factory<_i844.PropertyAccessDeleteUnitRepository>(() =>
        _i989.PropertyAccessDeleteUnitRepositoryImpl(
            propertyAccessRemoteDataSource:
                gh<_i329.PropertyAccessRemoteDataSource>()));
    gh.singleton<_i74.VehicleSearchDataSource>(
        () => _i645.VehicleSearchDataSourceImpl());
    gh.singleton<_i554.PropertiesRemoteDataSource>(
        () => _i427.PropertiesRemoteDataSourceImpl());
    gh.factory<_i274.DashboardService>(() => _i83.DashboardServiceImpl());
    gh.factory<_i892.PropertyAccessGetUnitsUseCase>(() =>
        _i892.PropertyAccessGetUnitsUseCase(
            propertyAccessGetUnitsRepository:
                gh<_i477.PropertyAccessGetUnitsRepository>()));
    gh.factory<_i785.PropertyAccessGetresidentRepository>(() =>
        _i696.PropertyAccessGetresidentRepositoryImpl(
            residentRemoteDataSource: gh<_i70.ResidentRemoteDataSource>()));
    gh.factory<_i12.PropertyAccessDeleteUnitUseCase>(() =>
        _i12.PropertyAccessDeleteUnitUseCase(
            propertyAccessDeleteUnitRepository:
                gh<_i844.PropertyAccessDeleteUnitRepository>()));
    gh.factory<_i844.PropertyAccessDeleteUnitRepositoryParams>(
        () => _i844.PropertyAccessDeleteUnitRepositoryParams(
              unitId: gh<String>(),
              blockId: gh<String>(),
            ));
    gh.factory<_i512.PropertyAccessAddUnitRepository>(() =>
        _i313.PropertyAccessAddUnitRepositoryImpl(
            propertyAccessRemoteDataSource:
                gh<_i329.PropertyAccessRemoteDataSource>()));
    gh.factory<_i944.PropertyAccessAddUnitUseCase>(() =>
        _i944.PropertyAccessAddUnitUseCase(
            propertyAccessAddUnitRepository:
                gh<_i512.PropertyAccessAddUnitRepository>()));
    gh.factory<_i262.DashboardGetVisitationsRepository>(() =>
        _i351.DashboardGetVisitationsRepositoryImpl(
            dashboardService: gh<_i274.DashboardService>()));
    gh.factory<_i1054.SignInService>(
        () => _i926.SignInServiceImpl(firebaseAuth: gh<_i59.FirebaseAuth>()));
    gh.factory<_i591.DashboardGetVisitationsUseCase>(() =>
        _i591.DashboardGetVisitationsUseCase(
            dashboardGetVisitationsRepository:
                gh<_i262.DashboardGetVisitationsRepository>()));
    gh.factory<_i261.DashboardPageLoadVisitationVehicleRepository>(() =>
        _i673.DashboardPageLoadVisitationVehicleRepositoryImpl(
            dashboardService: gh<_i274.DashboardService>()));
    gh.factory<_i340.VisitationSearchLoadVehicleUseCase>(() =>
        _i340.VisitationSearchLoadVehicleUseCase(
            visitationSearchLoadVehicleRepository:
                gh<_i705.VisitationSearchLoadVehicleRepository>()));
    gh.factory<_i571.PropertyAccessAddResidentUseCase>(() =>
        _i571.PropertyAccessAddResidentUseCase(
            propertyAccessAddResidentRepository:
                gh<_i806.PropertyAccessAddResidentRepository>()));
    gh.factory<_i171.SignInClickedRepository>(() =>
        _i673.SignInClickedRepositoryImpl(
            signInService: gh<_i1054.SignInService>()));
    gh.factory<_i845.SignInClickedUseCase>(() => _i845.SignInClickedUseCase(
        signInClickedRepository: gh<_i171.SignInClickedRepository>()));
    gh.factory<_i298.PropertyAccessGetresidentUseCase>(() =>
        _i298.PropertyAccessGetresidentUseCase(
            propertyAccessGetresidentRepository:
                gh<_i785.PropertyAccessGetresidentRepository>()));
    gh.factory<_i472.PropertiesDeleteBlockRepository>(() =>
        _i640.PropertiesDeleteBlockRepositoryImpl(
            propertiesRemoteDataSource:
                gh<_i554.PropertiesRemoteDataSource>()));
    gh.factory<_i1042.PropertiesGetBlocksRepository>(() =>
        _i375.PropertiesGetBlocksRepositoryImpl(
            propertiesRemoteDataSource:
                gh<_i554.PropertiesRemoteDataSource>()));
    gh.factory<_i1017.VehicleSearchValueChangedRepository>(() =>
        _i274.VehicleSearchValueChangedRepositoryImpl(
            vehicleSearchDataSource: gh<_i74.VehicleSearchDataSource>()));
    gh.factory<_i796.PropertyAccessBloc>(() => _i796.PropertyAccessBloc(
          propertyAccessGetUnitsUseCase:
              gh<_i892.PropertyAccessGetUnitsUseCase>(),
          propertyAccessDeleteUnitUseCase:
              gh<_i12.PropertyAccessDeleteUnitUseCase>(),
          propertyAccessAddUnitUseCase:
              gh<_i944.PropertyAccessAddUnitUseCase>(),
        ));
    gh.factory<_i729.VisitationSearchValueChangedRepository>(() =>
        _i583.VisitationSearchValueChangedRepositoryImpl(
            visitationSearchRemoteDataSource:
                gh<_i1059.VisitationSearchRemoteDataSource>()));
    gh.factory<_i142.PropertiesAddBlockClickedRepository>(() =>
        _i498.PropertiesAddBlockClickedRepositoryImpl(
            propertiesRemoteDataSource:
                gh<_i554.PropertiesRemoteDataSource>()));
    gh.factory<_i532.VehicleSearchLoadVisitationRepository>(() =>
        _i456.VehicleSearchLoadVisitationRepositoryImpl(
            vehicleSearchDataSource: gh<_i74.VehicleSearchDataSource>()));
    gh.factory<_i546.DashboardPageLoadVisitationVehicleUseCase>(() =>
        _i546.DashboardPageLoadVisitationVehicleUseCase(
            dashboardPageLoadVisitationVehicleRepository:
                gh<_i261.DashboardPageLoadVisitationVehicleRepository>()));
    gh.factory<_i790.PropertiesGetBlocksUseCase>(() =>
        _i790.PropertiesGetBlocksUseCase(
            propertiesGetBlocksRepository:
                gh<_i1042.PropertiesGetBlocksRepository>()));
    gh.factory<_i356.DashboardBloc>(() => _i356.DashboardBloc(
          get2DaysBackVisitations: gh<_i591.DashboardGetVisitationsUseCase>(),
          get3DaysBackVisitations: gh<_i591.DashboardGetVisitationsUseCase>(),
          get4DaysBackVisitations: gh<_i591.DashboardGetVisitationsUseCase>(),
          get5DaysBackVisitations: gh<_i591.DashboardGetVisitationsUseCase>(),
          get6DaysBackVisitations: gh<_i591.DashboardGetVisitationsUseCase>(),
          getTodaysVisitations: gh<_i591.DashboardGetVisitationsUseCase>(),
          getYesterdaysVisitations: gh<_i591.DashboardGetVisitationsUseCase>(),
          getCalenderDateVisitations:
              gh<_i591.DashboardGetVisitationsUseCase>(),
          dashboardPageLoadVisitationVehicleUseCase:
              gh<_i546.DashboardPageLoadVisitationVehicleUseCase>(),
        ));
    gh.factory<_i996.ResidentsBloc>(() => _i996.ResidentsBloc(
          propertyAccessAddResidentUseCase:
              gh<_i571.PropertyAccessAddResidentUseCase>(),
          propertyAccessGetresidentUseCase:
              gh<_i298.PropertyAccessGetresidentUseCase>(),
        ));
    gh.factory<_i165.VehicleSearchValueChangedUseCase>(() =>
        _i165.VehicleSearchValueChangedUseCase(
            vehicleSearchValueChangedRepository:
                gh<_i1017.VehicleSearchValueChangedRepository>()));
    gh.factory<_i950.VehicleSearchLoadVisitationUseCase>(() =>
        _i950.VehicleSearchLoadVisitationUseCase(
            vehicleSearchLoadVisitationRepository:
                gh<_i532.VehicleSearchLoadVisitationRepository>()));
    gh.factory<_i888.PropertiesDeleteBlockUseCase>(() =>
        _i888.PropertiesDeleteBlockUseCase(
            propertiesDeleteBlockRepository:
                gh<_i472.PropertiesDeleteBlockRepository>()));
    gh.factory<_i403.PropertiesAddBlockClickedUseCase>(() =>
        _i403.PropertiesAddBlockClickedUseCase(
            propertiesAddBlockClickedRepository:
                gh<_i142.PropertiesAddBlockClickedRepository>()));
    gh.factory<_i1022.LoginBloc>(() => _i1022.LoginBloc(
        signInClickedUseCase: gh<_i845.SignInClickedUseCase>()));
    gh.factory<_i545.VehicleSearchBloc>(() => _i545.VehicleSearchBloc(
          vehicleSearchLoadVisitationUseCase:
              gh<_i950.VehicleSearchLoadVisitationUseCase>(),
          vehicleSearchValueChangedUseCase:
              gh<_i165.VehicleSearchValueChangedUseCase>(),
        ));
    gh.factory<_i500.VisitationSearchValueChangedUseCase>(() =>
        _i500.VisitationSearchValueChangedUseCase(
            visitationSearchValueChangedRepository:
                gh<_i729.VisitationSearchValueChangedRepository>()));
    gh.factory<_i304.PropertiesBloc>(() => _i304.PropertiesBloc(
          propertiesAddBlockClickedUseCase:
              gh<_i403.PropertiesAddBlockClickedUseCase>(),
          propertiesGetBlocksUseCase: gh<_i790.PropertiesGetBlocksUseCase>(),
          propertiesDeleteBlockUseCase:
              gh<_i888.PropertiesDeleteBlockUseCase>(),
        ));
    gh.factory<_i486.VisitationSearchBloc>(() => _i486.VisitationSearchBloc(
          visitationSearchLoadVehicleUseCase:
              gh<_i340.VisitationSearchLoadVehicleUseCase>(),
          valueChangedUseCase: gh<_i500.VisitationSearchValueChangedUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModules extends _i775.RegisterModules {
  @override
  _i504.AppLocalizations get appLocalizations => _i504.AppLocalizations();
}
