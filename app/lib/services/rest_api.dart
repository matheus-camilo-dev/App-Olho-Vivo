import 'dart:convert';
import 'dart:io';

import 'package:app/models/bus_line.dart';
import 'package:http/http.dart';

import '../shared/constants.dart';

class RestAPI{
  final url = urlApi;
  final apiToken = tokenApi;
  String? cookie;

  Future<bool> login() async {
    final response = await post(
      '$url/Login/Autenticar?token=$apiToken'
    );
    cookie = response.headers['set-cookie'];
    return response.body == "true";
  }

  Future<List<BusLine>> getLines(String search) async {
    final response = await get(
      '$url/Linha/Buscar?termosBusca=$search',
      headers: {
        'cookie': cookie ?? '',
      }
    );

    final data = json.decode(response.body);
    List<BusLine> busLines = List<BusLine>.from(data.map((model)=> BusLine.fromJson(model)));
    return busLines;
  }
}