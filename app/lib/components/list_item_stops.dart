import 'package:app/models/bus_stop.dart';
import 'package:flutter/material.dart';

class ListItemStops extends StatefulWidget {
  final BusStop parada;

  const ListItemStops(this.parada, {Key? key}) : super(key: key);

  @override
  State<ListItemStops> createState() => _ListItemState();
}

class _ListItemState extends State<ListItemStops> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: Column(
              children: [
                Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        child: Row(
                      children: [
                        Text(
                          'Nome: ',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        Expanded(
                          child: Text(
                            (widget.parada.nome != '') ? widget.parada.nome : '(Nome não encontrado)',
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 17),
                          ),
                        )
                      ],
                    )),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        child: Row(
                      children: [
                        Text(
                          'Endereco: ',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        Expanded(
                          child: Text(
                            (widget.parada.endereco != '') ? widget.parada.endereco : '(Endereço não encontrado)',
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 17),
                          ),
                        )
                      ],
                    )),
                  )
                ])
              ],
            ),
            tileColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
