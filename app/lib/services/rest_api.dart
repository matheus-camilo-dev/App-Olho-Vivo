import 'dart:convert';

import 'package:app/models/bus.dart';
import 'package:app/models/bus_line.dart';
import 'package:app/models/bus_position.dart';
import 'package:app/models/bus_stop.dart';
import 'package:http/http.dart';

import '../shared/constants.dart';

class RestAPI {
  final url = urlApi;
  final apiToken = tokenApi;
  String? cookie;

  Future<bool> login() async {
    final response = await post('$url/Login/Autenticar?token=$apiToken');
    cookie = response.headers['set-cookie'];
    return response.body == "true";
  }

  Future<List<BusLine>> getLines(String search) async {
    await login();

    final response =
        await get('$url/Linha/Buscar?termosBusca=$search', headers: {
      'cookie': cookie ?? '',
    });

    final data = json.decode(response.body);
    List<BusLine> busLines =
        List<BusLine>.from(data.map((model) => BusLine.fromJson(model)));
    return busLines;
  }

  Future<List<BusStop>> getStops(String search) async {
    await login();
    var response =
        await get('$url/Parada/Buscar?termosBusca=$search', headers: {
      'cookie': cookie ?? '',
    });

    final data = json.decode(response.body);
    List<BusStop> busStops =
        List<BusStop>.from(data.map((model) => BusStop.fromJson(model)));
    return busStops;
  }

  Future<List<BusPosition>> getBusPosition() async {
    await login();
    var response =
        await get('$url/Posicao', headers: {
      'cookie': cookie ?? '',
    });

    final data = json.decode(response.body);

    List<BusPosition> busPosition = [];
    for (var item in data['l']) {
      var busList = List<Bus>.from(item['vs'].map((model) => Bus.fromJson(model)));
      busPosition.add(BusPosition.fromJson(item, data['hr'], busList));
    }
    return busPosition;
  }
}
