import 'package:app/data_objects/menu_enum.dart';
import 'package:app/services/rest_api.dart';
import 'package:app/shared/utils/debbuger.dart';
import 'package:flutter/material.dart';

import '../shared/constants.dart';

class BaseSearchPage extends StatefulWidget {
  final MenuNavigation menuNavigation;
  String appBarTitle = 'Buscar';
  List<String> data = ["a", "b", "c", "d", "e"];

  BaseSearchPage(this.menuNavigation, {Key? key}) : super(key: key);

  @override
  State<BaseSearchPage> createState() => _BaseSearchPageState();
}

class _BaseSearchPageState extends State<BaseSearchPage> {
  final restApi = RestAPI();

  @override
  void initState() {
    if (widget.menuNavigation == MenuNavigation.lines) {
      widget.appBarTitle = 'Buscar Linhas';
    } else {
      widget.appBarTitle = 'Buscar Paradas';
    }
  }

  void logarApi() async {
    if (await restApi.login()) {
      print("Usuário Logado com Sucesso!");
    }
  }

  void pegarParadas() async{
    var paradas = await restApi.getStops("Santo");
    printBusStops(paradas);
  }

  void pegarLocalizacaoVeiculos() async {
    var localizacaoVeiculos = await restApi.getBusPosition();
    printBusPosition(localizacaoVeiculos, 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          widget.appBarTitle,
          style: const TextStyle(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: const BoxConstraints().maxHeight,
          width: const BoxConstraints().maxWidth,
          color: Colors.purple,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: title,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: TextButton(
                  onPressed: pegarLocalizacaoVeiculos,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "Buscar",
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.data.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
                      child: ListTile(
                      title: Text(widget.data[index]),
                      tileColor: Colors.white,
                    ),),
                  );
              },
            ),
            ],
          ),
        ),
      ),
    );
  }
}
