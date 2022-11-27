import 'package:app/data_objects/menu_enum.dart';
import 'package:app/pages/base_search_page.dart';
import 'package:flutter/material.dart';

class MenuItemNav extends StatefulWidget {
  final String menuItemName;
  final MenuNavigation route;

  const MenuItemNav(this.route, {Key? key, this.menuItemName = ''})
      : super(key: key);

  @override
  State<MenuItemNav> createState() => _MenuItemNavState();
}

class _MenuItemNavState extends State<MenuItemNav> {
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
