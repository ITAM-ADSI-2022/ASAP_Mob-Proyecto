import 'package:cafeitam/data/actual.dart';
import 'package:cafeitam/editarMenuDelDia.dart';
import 'package:cafeitam/login.dart';
import 'package:cafeitam/widgets/tiles.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<Map> ordenes = [];

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
          _drawerTile("Editar Menú Del Día", EditarMenuDia()),
          _drawerTile("Cerrar Sesión", Login())
        ],
      ),
    );
  }

  void check(int folio) {
    Map temp = DatosActuales.ordenesActuales[folio];
    setState(() {
      DatosActuales.ordenesActuales.remove(folio);
    });
    DatosActuales.ordenesPasadas[folio] = temp;
  }

  void cancel(int folio) {
    setState(() {
      DatosActuales.ordenesActuales.remove(folio);
    });
  }

  Widget _mainColumn(BuildContext context) {
    List<Map> actuales = [];
    for (Map data in DatosActuales.ordenesActuales.values) {
      actuales.add(data);
    }
    double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;
    actuales.sort((a, b) =>
        toDouble(a["horaDeEntrega"]).compareTo(toDouble(b["horaDeEntrega"])));
    return ListView.builder(
        itemCount: DatosActuales.ordenesActuales.length,
        itemBuilder: (context, index) =>
            ordenTile(context, actuales[index], check, cancel));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _drawer(context),
        appBar: AppBar(title: Text("Cafe ITAM | Ordenes")),
        body: _mainColumn(context));
  }
}
