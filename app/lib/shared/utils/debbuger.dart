import 'package:app/models/bus_line.dart';
import 'package:app/models/bus_position.dart';
import 'package:app/models/bus_stop.dart';
import 'package:app/shared/models/postion.dart';

void printBusPosition(List<BusPosition> busPositions, int quantidade){
  int i = 0;
  for (var busPosition in busPositions) {
      print('\n');
      print('Horario: ${busPosition.horario}');
      print('Numero Onibus: ${busPosition.linhaOnibus.numeroOnibus}');
      print('Linha Onibus Ida: ${busPosition.linhaOnibus.ida}');
      print('Linha Onibus Volta: ${busPosition.linhaOnibus.volta}');
      print('Quantidade de veiculos: ${busPosition.quantidadeVeiculos}');
      print('Lista Onibus:');
      for (var bus in busPosition.listaOnibus) {
        print('[');
        print('    Id: ${bus.id}');
        print('    Está Ativo: ${bus.ativo}');
        printPosition(bus.posicao, '    ');
        print('],');
      }
      print('\n');
      if(i >= quantidade) break;
      i++;
  }
}

void printBusLines(List<BusLine> busLines){
  for (var line in busLines) {
    print('\n');
    print('[');
    print('    Numero Onibus: ${line.numeroOnibus}');
    print('    Ida: ${line.ida}');
    print('    Volta: ${line.volta}');
    print(']');
    print('\n');
  }
}

void printBusStops(List<BusStop> busStops){
  for (var stop in busStops) {
    print('\n');
    print('[');
    print('    Nome: ${stop.nome}');
    print('    Endereco: ${stop.endereco}');
    print('    : ${stop.posicao}');
    print(']');
    print('\n');
  }
}

void printPosition(Position? position, String starter){
  print('${starter}Posicao: {');
  print('${starter}    X: ${position?.x}');
  print('${starter}    Y: ${position?.y}');
  print('${starter}}');
}