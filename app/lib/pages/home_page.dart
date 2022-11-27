import 'package:app/dataObjects/menu_enum.dart';
import 'package:app/models/bus_line.dart';
import 'package:app/pages/bus_line_page.dart';
import 'package:app/services/rest_api.dart';
import 'package:flutter/material.dart';

import '../components/menuItem.dart';

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
      body: SafeArea(
        child: Container(
            height: const BoxConstraints().maxHeight,
            width: const BoxConstraints().maxWidth,
            color: Colors.purple,
            child:  Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "O que você busca?",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 100,
                ),
                const MenuItemNav(MenuNavigation.lines, menuItemName: "Linhas"),
                const SizedBox(
                  height: 20,
                ),
                const MenuItemNav(MenuNavigation.stops, menuItemName: "Paradas"),
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/onibus.jpeg'),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
