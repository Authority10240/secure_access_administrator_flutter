import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
part 'biometrics_local_model.g.dart';
@Injectable()

@HiveType(typeId: 5)
class BiometricsLocalModel {

  @HiveField(0)
  late bool? enabled ;


  BiometricsLocalModel({
   required this.enabled});



}