import 'package:app/models/bus_line.dart';
import 'package:app/pages/bus_line_page.dart';
import 'package:app/services/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../shared/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final restApi = RestAPI();

  void logarApi() async {
    if (await restApi.login()) {
      print("Usuário Logado com Sucesso!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingActionButton(
        child: Text("Linhas"),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BusLinePage()),),
        )
    );
  }
}