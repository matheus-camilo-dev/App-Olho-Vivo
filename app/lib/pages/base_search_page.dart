import 'package:app/data_objects/menu_enum.dart';
import 'package:app/models/bus_line.dart';
import 'package:app/models/bus_stop.dart';
import 'package:app/services/rest_api.dart';
import 'package:app/shared/utils/debbuger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../shared/constants.dart';

class BaseSearchPage extends StatefulWidget {
  final MenuNavigation menuNavigation;
  String appBarTitle = 'Buscar';
  List<BusStop> lstParadas = [];
  List<BusLine> lstLinhas = [];

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
      print("UsuÃ¡rio Logado com Sucesso!");
    }
  }

  void pegarParadas() async {
    widget.lstParadas = await restApi.getStops("Santo");
    printBusStops(widget.lstParadas);
  }

  void pegarLinhas() async {
    widget.lstLinhas = await restApi.getLines("Amaro");
    printBusLines(widget.lstLinhas);
  }

  bool ehPaginaDeLinha(){
    return widget.menuNavigation == MenuNavigation.lines;
  }

  void getAPI() async {
    if (widget.menuNavigation == MenuNavigation.lines) {
      pegarLinhas();
    } else {
      pegarParadas();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Observer(builder: (_) => Scaffold(
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
                  onPressed: () {
                    setState(() {
                      getAPI();
                    });
                  },
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
                itemCount: ehPaginaDeLinha() ? widget.lstLinhas.length : widget.lstParadas.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: ListTile(
                      title: Text(ehPaginaDeLinha() ? widget.lstLinhas[index].numeroOnibus : widget.lstParadas[index].nome),
                      tileColor: Colors.white,
                    ),
                    ),
                  );
              },
            ),
            ],
          ),
        ),
      ),
    ));
  }
}
