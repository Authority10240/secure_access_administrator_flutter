import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
part 'sign_in_local_model.g.dart';
@Injectable()

@HiveType(typeId: 6)
class SignInLocalModel {

  @HiveField(0)
  late bool? signedIn ;


  SignInLocalModel({
    required this.signedIn});



}