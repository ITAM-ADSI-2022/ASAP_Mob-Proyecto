import 'package:badges/badges.dart';
import 'package:cafeitam/carrito.dart';
import 'package:cafeitam/carritoObj.dart';
import 'package:cafeitam/data/menuCategorias.dart';
import 'package:cafeitam/login.dart';
import 'package:cafeitam/data/menuData.dart';
import 'package:cafeitam/misOrdedes.dart';
import 'package:cafeitam/utils/functionality.dart';
import 'package:cafeitam/widgets/cards.dart';
import 'package:cafeitam/widgets/carritoIcon.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const double regularHeight = 150;
  static const double regularWidth = 150;

  void pedirMenuDelDia() {
    Carrito.items[0] = 1;
    goto(context, CarritoPage());
  }

  Widget _drawerTile(String title, Widget pageToPush) {
    return ListTile(
      title: Text(title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
              //fontSize: 18,
              //fontWeight: FontWeight.w400,
              )),
      minLeadingWidth: 0,
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => pageToPush));
      },
    );
  }

  Widget _drawer(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 64,
          ),
          _drawerTile("Mi Cuenta", MyHomePage()),
          _drawerTile("Mis Pedidos", MisOrdenes()),
          _drawerTile("Ayuda", MyHomePage()),
          _drawerTile("Cerrar Sesión", Login())
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _drawer(context),
        appBar: AppBar(title: Text("Cafe ITAM"), actions: [
          CarritoIconButton(
              items: Carrito.items,
              f: () => setState(() {
                    Carrito.items = Carrito.items;
                  }))
        ]),
        body: _mainColumn(context));
  }

  Widget _mainColumn(BuildContext context) {
    List<Widget> content = [
      _categoryTitle("Menú del día"),
      menuDelDiaCard(pedirMenuDelDia),
    ];
    for (String categoria in categoriasMenu.keys) {
      List list = [];
      for (int id in categoriasMenu[categoria]) list.add(menuItems[id]);
      content.add(categoryListView(
          context, categoria, list, menuItemCard, regularHeight, regularWidth));
    }
    content.add(Container(height: 24));

    return ListView(
      children: content,
    );
  }

  Widget _categoryTitle(String s) {
    return Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 24, bottom: 8),
        child: Text(s,
            style: Theme.of(context)
                .textTheme
                .headline6) //TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        );
  }

  Widget categoryListView(BuildContext context, String categoryTitle, List list,
      Function cardFunction, double cardWidth, double cardHeight) {
    return list.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _categoryTitle(categoryTitle),
              Container(
                height: cardHeight,
                child: Theme(
                  data: Theme.of(context).copyWith(
                      accentColor: Theme.of(context).scaffoldBackgroundColor),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length + 2,
                    itemBuilder: (context, index) {
                      return index == 0 || index == list.length + 1
                          ? Container(width: 16)
                          : cardFunction(
                              list[index - 1],
                              cardWidth,
                              cardHeight,
                              context,
                              () => setState(() {
                                    Carrito.items = Carrito.items;
                                  }));
                    },
                  ),
                ),
              )
            ],
          )
        : Container();
  }
}
