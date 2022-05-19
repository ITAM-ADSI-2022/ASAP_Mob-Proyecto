import 'package:cafeitam/data/actual.dart';
import 'package:cafeitam/widgets/cards.dart';
import 'package:flutter/material.dart';

class MisOrdenes extends StatefulWidget {
  const MisOrdenes({Key? key}) : super(key: key);

  @override
  State<MisOrdenes> createState() => _MisOrdenesState();
}

class _MisOrdenesState extends State<MisOrdenes> {
  @override
  Widget build(BuildContext context) {
    int actuales = 0;
    //Actuales
    for (Map data in DatosActuales.ordenesActuales.values) {
      if (data["idPidio"] == DatosActuales.idActual) actuales++;
    }
    int pasados = 0;
    //Pasados
    for (Map data in DatosActuales.ordenesPasadas.values) {
      if (data["idPidio"] == DatosActuales.idActual) pasados++;
    }
    //Content
    List<Widget> content = [];
    if (actuales > 0) {
      content = [
        Container(height: 24),
        Text("Pedidos actuales", style: Theme.of(context).textTheme.headline5),
        Container(height: 36),
      ];
      //Actuales
      for (Map data in DatosActuales.ordenesActuales.values) {
        if (data["idPidio"] == DatosActuales.idActual)
          content.add(pedidoCard(context, data));
      }
    }
    if (pasados > 0) {
      content = content +
          [
            Container(height: 24),
            Text("Pedidos pasados",
                style: Theme.of(context).textTheme.headline5),
            Container(height: 16)
          ];
      //Pasados
      for (Map data in DatosActuales.ordenesPasadas.values) {
        if (data["idPidio"] == DatosActuales.idActual)
          content.add(pedidoCard(context, data));
      }
    }
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(leading: BackButton(), title: Text("Mis Pedidos")),
        body: actuales <= 0 && pasados <= 0
            ? Center(
                child: Text("No tienes pedidos"),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: content,
                )));
  }
}
