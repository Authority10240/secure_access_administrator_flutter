class VehicleSearchCriteria{

  VehicleSearchCriteria({this.from, this.unit, this.to, this.color, this.model, this.idNumber, this.licenseNumber, this.make});

  String? color;
  String? make;
  String? model;
  String? idNumber;
  String? licenseNumber;
  String? unit;
  DateTime? from ;
  DateTime? to;
}