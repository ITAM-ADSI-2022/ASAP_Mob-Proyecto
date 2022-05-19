import 'package:cafeitam/carrito.dart';
import 'package:cafeitam/carritoObj.dart';
import 'package:cafeitam/data/menuData.dart';
import 'package:cafeitam/utils/functionality.dart';
import 'package:cafeitam/widgets/actionButton.dart';
import 'package:cafeitam/widgets/carritoIcon.dart';
import 'package:flutter/material.dart';

class Detalles extends StatefulWidget {
  final int id;

  const Detalles({Key? key, required this.id}) : super(key: key);

  @override
  State<Detalles> createState() => _DetallesState(id);
}

class _DetallesState extends State<Detalles> {
  int id;
  int cuantos = 0;
  _DetallesState(this.id);

  @override
  void initState() {
    if (Carrito.items.keys.contains(id)) {
      cuantos = Carrito.items[id];
    } else {
      cuantos = 0;
    }
    super.initState();
  }

  void actualizarCarrito() {
    Carrito.items[id] = cuantos;
    if (Carrito.items[id] <= 0) {
      Carrito.items.remove(id);
    }
    print(Carrito.items);
  }

  Widget boton() {
    double buttonSize = 32;
    double cuantosSize = 24;
    return cuantos == 0
        ? CustomActionButton(
            text: "Agregar a Carrito",
            onPressed: () {
              setState(() {
                cuantos = 1;
              });
              actualizarCarrito();
            },
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      cuantos -= 1;
                    });
                    actualizarCarrito();
                  },
                  child: Text("-", style: TextStyle(fontSize: buttonSize))),
              Text("$cuantos", style: TextStyle(fontSize: cuantosSize)),
              TextButton(
                  onPressed: () {
                    setState(() {
                      cuantos += 1;
                    });
                    actualizarCarrito();
                  },
                  child: Text("+", style: TextStyle(fontSize: buttonSize)))
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    Map data = menuItems[this.id];
    return Scaffold(
        floatingActionButton:
            Padding(padding: const EdgeInsets.all(8.0), child: boton()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(leading: BackButton(), actions: [
          CarritoIconButton(
              items: Carrito.items,
              f: () => setState(() {
                    if (Carrito.items.keys.contains(id)) {
                      cuantos = Carrito.items[id];
                    } else {
                      cuantos = 0;
                    }
                  }))
        ]),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  "imagenes/" + data["foto"],
                  fit: BoxFit.cover,
                )),
            Container(height: 8),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data["nombre"],
                      style: Theme.of(context).textTheme.headline5),
                  Text('\$${data["precio"]}',
                      style: Theme.of(context).textTheme.headline6),
                  Container(height: 24),
                  Text(data["detalles"]),
                  Container(height: 24),
                ],
              ),
            ),
          ],
        ));
  }
}
