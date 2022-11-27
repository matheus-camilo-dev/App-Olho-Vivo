import 'package:app/models/bus_line.dart';
import 'package:app/services/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../shared/constants.dart';

class BusStopsPage extends StatefulWidget {
  const BusStopsPage({Key? key}) : super(key: key);

  @override
  State<BusStopsPage> createState() => _BusStopsPageState();
}

class _BusStopsPageState extends State<BusStopsPage> {
  final restApi = RestAPI();

  void logarApi() async {
    if (await restApi.login()) {
      print("Usuário Logado com Sucesso!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.red,),);
  }
}