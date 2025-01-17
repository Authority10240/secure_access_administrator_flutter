import 'package:intl/intl.dart';
extension DateExtension on String{

  String toFormattedDate(){
    return DateFormat('dd MMM yyyy').format(DateTime.parse(this));
  }

  String toFormattedTime(){
    return DateFormat("hh:mm").format(DateTime.parse(this));
  }

  String toFirebaseDate (){
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(this));
  }
}

