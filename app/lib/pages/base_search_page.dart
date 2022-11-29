import 'package:app/components/list_item_lines.dart';
import 'package:app/components/list_item_stops.dart';
import 'package:app/data_objects/menu_enum.dart';
import 'package:app/models/bus_line.dart';
import 'package:app/models/bus_stop.dart';
import 'package:app/services/rest_api.dart';
import 'package:app/shared/utils/debbuger.dart';
import 'package:app/shared/utils/functions.dart';
import 'package:flutter/material.dart';

import '../shared/constants.dart';

class BaseSearchPage extends StatefulWidget {
  final MenuNavigation menuNavigation;

  const BaseSearchPage(this.menuNavigation, {Key? key}) : super(key: key);

  @override
  State<BaseSearchPage> createState() => _BaseSearchPageState();
}

class _BaseSearchPageState extends State<BaseSearchPage> {
  String appBarTitle = 'Buscar';
  List<BusStop> lstParadas = [];
  List<BusLine> lstLinhas = [];
  final restApi = RestAPI();
  bool search = false;

  final textController = TextEditingController();

  @override
  void initState() {
    if (widget.menuNavigation == MenuNavigation.lines) {
      appBarTitle = 'Buscar Linhas';
    } else {
      appBarTitle = 'Buscar Paradas';
    }
    search = false;
  }

  Future<void> pegarParadas() async {
    lstParadas = await restApi.getStops(textController.text);
    printBusStops(lstParadas, 10);
  }

  Future<void> pegarLinhas() async {
    lstLinhas = await restApi.getLines(textController.text);
    printBusLines(lstLinhas, 10);
  }

  Future<void> getAPI() async {
    if (widget.menuNavigation == MenuNavigation.lines) {
      await pegarLinhas();
    } else {
      await pegarParadas();
    }
    search = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          appBarTitle,
          style: const TextStyle(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: const BoxConstraints().maxHeight,
          width: const BoxConstraints().maxWidth,
          color: primaryColor,
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
                  onPressed: () async {
                    await getAPI();
                    setState(() {});
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
                      style: TextStyle(color: primaryColor, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ((ehPaginaDeLinha(widget.menuNavigation)
                                ? lstLinhas.length
                                : lstParadas.length) !=
                            0)
                    ? ListView.builder(
                        itemCount: ehPaginaDeLinha(widget.menuNavigation)
                            ? lstLinhas.length
                            : lstParadas.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return (ehPaginaDeLinha(widget.menuNavigation))
                              ? ListItemLines(lstLinhas[index])
                              : ListItemStops(lstParadas[index]);
                        },
                      )
                    : (search == true) ? Text(
                        "Não foi encontrado nenhum resultado!",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    : Container()
              )
            ],
          ),
        ),
      ),
    );
  }
}
