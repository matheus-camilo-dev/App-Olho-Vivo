import '../shared/models/postion.dart';

class Bus {
  final int id;
  final bool ativo;
  final Position?  posicao;

  Bus(this.id, this.ativo, { this.posicao });

  factory Bus.fromJson(dynamic data) {
    return Bus(data['p'], data['a'] as bool, posicao: Position(data['px'], data['py']));
  }
}
