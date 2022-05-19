import 'package:cafeitam/carritoObj.dart';
import 'package:cafeitam/data/actual.dart';
import 'package:cafeitam/data/menuData.dart';
import 'package:cafeitam/data/ordenesActualesData.dart';
import 'package:cafeitam/home.dart';
import 'package:cafeitam/misOrdedes.dart';
import 'package:cafeitam/utils/functionality.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/actionButton.dart';

class CarritoPage extends StatefulWidget {
  const CarritoPage({Key? key}) : super(key: key);

  @override
  State<CarritoPage> createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  Map items = {};
  bool _recuerdaPreferencias = true;

  TimeOfDay? horaDeEntrega = TimeOfDay(hour: 12, minute: 0);

  final TextEditingController _controllerComentarios = TextEditingController();

  double total = 0;

  @override
  void initState() {
    this.items = Carrito.items;
    print(this.items);
    super.initState();
  }

  void eliminar(int item) {
    print(Carrito.items);
    print(item);
    setState(() {
      Carrito.items[item] -= 1;
      if (Carrito.items[item] <= 0) {
        Carrito.items.remove(item);
      }
    });
    if (Carrito.items.isEmpty) {
      Navigator.pop(context);
    }
  }

  void pedir() {
    String comentarios = _controllerComentarios.text;

    DatosActuales.ordenesActuales[nextFolio] = {
      "folio": nextFolio,
      "items": Carrito.items,
      "idPidio": DatosActuales.idActual,
      "comentario": comentarios,
      "horaDeEntrega": horaDeEntrega,
      "total": total,
      "fecha": DateTime.now()
    };
    nextFolio++;
    Carrito.items = {};

    showSnack(
        context: context,
        text: "Su pedido a sido realizado. Disponible en Mis Pedidos.",
        durationInSeconds: 5);

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => MyHomePage()), (route) => false);

    print(DatosActuales.ordenesActuales);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(leading: BackButton(), title: Text("Carrito")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Carrito.items.isEmpty
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Center(child: Text("Tu carrito esta vacio"))],
                )
              : ListView(
                  children: [
                    Container(height: 8),
                    Text("Tu orden",
                        style: Theme.of(context).textTheme.headline5),
                    _resumenOrden(),
                    Container(height: 16),
                    Text("Detalles de Pedido",
                        style: Theme.of(context).textTheme.headline5),
                    Container(height: 8),
                    Text(
                      "Comentarios y Preferencias",
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(height: 16),
                    _comentarios(),
                    CheckboxListTile(
                        title: Text("Guarda mis preferencias"),
                        value: _recuerdaPreferencias,
                        onChanged: (v) {
                          setState(() {
                            _recuerdaPreferencias = v ?? true;
                          });
                        }),
                    Container(height: 16),
                    Text(
                      "Ingresa la hora a la que recogerás tu pedido",
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(height: 16),
                    _hora(context),
                    Container(height: 24),
                    CustomActionButton(
                      text: "PEDIR",
                      onPressed: pedir,
                    ),
                    Container(height: 24)
                  ],
                ),
        ));
  }

  Widget _resumenOrden() {
    List<Widget> lvs = [];
    total = 0;
    for (var item in this.items.keys) {
      double precio = (this.items[item] * menuItems[item]["precio"]).toDouble();
      total += precio;
      lvs.add(ListTile(
          title: Text(menuItems[item]["nombre"]),
          subtitle: Row(
            children: [
              Text("x${this.items[item]}"),
              Container(width: 16),
              InkWell(onTap: () => eliminar(item), child: Text("Eliminar"))
            ],
          ),
          trailing: Text("\$${precio}")));
    }
    lvs.add(ListTile(title: Text("Total"), trailing: Text("\$${total}")));
    return Column(
      children: lvs,
    );
  }

  Widget _comentarios() {
    return TextField(
      controller: _controllerComentarios,
      maxLines: 3,
      decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          hintText: "Ingresa tus preferencias para tu pedido. Eg. Sin cebolla"),
    );
  }

  Widget _hora(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${horaDeEntrega?.format(context)}",
            style: TextStyle(fontSize: 16)),
        Container(width: 8),
        TextButton(
            onPressed: () async {
              TimeOfDay? temp = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: 14, minute: 00),
              );
              setState(() {
                horaDeEntrega = temp;
              });
            },
            child: Text("Seleccionar", style: TextStyle(fontSize: 16))),
      ],
    );
  }
}
