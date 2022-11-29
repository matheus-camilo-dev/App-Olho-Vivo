import 'package:app/components/list_item_lines.dart';
import 'package:app/components/list_item_stops.dart';
import 'package:app/data_objects/menu_enum.dart';
import 'package:app/models/bus_line.dart';
import 'package:app/models/bus_stop.dart';
import 'package:app/services/rest_api.dart';
import 'package:app/shared/utils/debbuger.dart';
import 'package:app/shared/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

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

  final textController = TextEditingController();

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
    print(textController.text);
  }

  void pegarParadas() async {
    widget.lstParadas = await restApi.getStops(textController.text);
    printBusStops(widget.lstParadas, 10);
  }

  void pegarLinhas() async {
    widget.lstLinhas = await restApi.getLines(textController.text);
    printBusLines(widget.lstLinhas,10);
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
                  controller: textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: "Digite o numero do onibus",
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
              Observer(builder: (_) =>
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: ehPaginaDeLinha(widget.menuNavigation) ? widget.lstLinhas.length : widget.lstParadas.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return (ehPaginaDeLinha(widget.menuNavigation)) ? ListItemLines(widget.lstLinhas[index]) : ListItemStops(widget.lstParadas[index]);
                },
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
