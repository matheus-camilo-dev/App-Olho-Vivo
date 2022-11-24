class BusLine{
  String numeroOnibus;
  String ida;
  String volta;

  BusLine(
    this.numeroOnibus,
    this.ida,
    this.volta
  );

  factory BusLine.fromJson(dynamic data){
    return BusLine(data['lt'] as String, data['tp'] as String, data['ts'] as String);
  }
}