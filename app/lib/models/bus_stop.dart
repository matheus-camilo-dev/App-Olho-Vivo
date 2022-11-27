import '../shared/models/postion.dart';

class BusStop {
  final String nome;
  final String endereco;
  final Position posicao;

  BusStop(this.nome, this.endereco, this.posicao);

  factory BusStop.fromJson(dynamic data) {
    return BusStop(data['np'] as String, data['ed'] as String,
        Position(data['py'], data['px']));
  }
}
