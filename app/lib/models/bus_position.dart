import 'package:app/models/bus.dart';
import 'package:app/models/bus_line.dart';

class BusPosition {
  final String horario;
  final BusLine linhaOnibus;
  final int quantidadeVeiculos;
  List<Bus> listaOnibus;

  BusPosition(this.horario, this.linhaOnibus, this.quantidadeVeiculos, this.listaOnibus);

  factory BusPosition.fromJson(dynamic data, String datetime, List<Bus> busList) {
    return BusPosition(
      datetime, 
      BusLine(data['c'], data['lt0'], data['lt1']),
      data['qv'],
      busList
    );
  }
}
