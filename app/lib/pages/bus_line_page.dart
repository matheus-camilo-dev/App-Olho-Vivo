import 'package:app/models/bus_line.dart';
import 'package:app/services/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../shared/constants.dart';

class BusLinePage extends StatefulWidget {
  const BusLinePage({Key? key}) : super(key: key);

  @override
  State<BusLinePage> createState() => _BusLinePageState();
}

class _BusLinePageState extends State<BusLinePage> {
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