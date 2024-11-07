
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access_administrator/core/base_classes/base_bloc.dart';
import 'package:secure_access_administrator/core/base_classes/base_event.dart';
import 'package:secure_access_administrator/core/base_classes/base_state.dart';

part 'vehicle_search_event.dart';
part 'vehicle_search_state.dart';

@injectable
class VehicleSearchBloc
    extends BaseBloc<VehicleSearchPageEvent, VehicleSearchPageState> {
    VehicleSearchBloc(): super(VehicleSearchPageInitState()) {}
} 
