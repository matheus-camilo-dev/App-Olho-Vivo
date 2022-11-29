import 'package:app/models/bus_line.dart';
import 'package:flutter/material.dart';

class ListItemLines extends StatefulWidget {
  final BusLine linha;

  const ListItemLines(this.linha, {Key? key}) : super(key: key);

  @override
  State<ListItemLines> createState() => _ListItemState();
}

class _ListItemState extends State<ListItemLines> {
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
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        child: Text(
                      widget.linha.numeroOnibus,
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ))),
                const SizedBox(height: 5,),
                Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Row(children: [
                        Text(
                        'Ida: ',
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Expanded(child: Text(
                        widget.linha.ida,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 17),
                      ),)
                      ],)
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Row(children: [
                        Text(
                        'Volta: ',
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Expanded(child: Text(
                        widget.linha.volta,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 17),
                      ),)
                      ],)
                    ),
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
