import 'package:app/data_objects/menu_enum.dart';
import 'package:app/pages/base_search_page.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {

  const ListItem({Key? key})
      : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context){
              return BaseSearchPage(widget.route);
            }),
          );
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
          child: Text(
            widget.menuItemName,
            style: const TextStyle(color: Colors.purple, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
