import 'package:cafeitam/data/actual.dart';
import 'package:cafeitam/data/menuCategorias.dart';
import 'package:cafeitam/data/menuData.dart';
import 'package:cafeitam/utils/functionality.dart';
import 'package:flutter/material.dart';

class EditarMenuDia extends StatefulWidget {
  const EditarMenuDia({Key? key}) : super(key: key);

  @override
  State<EditarMenuDia> createState() => _EditarMenuDiaState();
}

class _EditarMenuDiaState extends State<EditarMenuDia> {
  int _sopa = DatosActuales.menuDelDia["Sopas"];
  int _fuerte = DatosActuales.menuDelDia["Platos Fuertes"];
  int _bebida = DatosActuales.menuDelDia["Bebidas"];
  int _postre = DatosActuales.menuDelDia["Postres"];

  void actualizar() {
    DatosActuales.menuDelDia["Sopas"] = _sopa;
    DatosActuales.menuDelDia["Platos Fuertes"] = _fuerte;
    DatosActuales.menuDelDia["Bebidas"] = _bebida;
    DatosActuales.menuDelDia["Postres"] = _postre;
    print(DatosActuales.menuDelDia);
    showSnack(context: context, text: "Se actualizado el menú del día");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: actualizar,
          child: Icon(Icons.save),
        ),
        appBar: AppBar(leading: BackButton(), title: Text("Cafe ITAM")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              Container(height: 24),
              Text("Editar Menú del día",
                  style: Theme.of(context).textTheme.headline5),

              //Sopa
              Container(height: 24),
              Text("Sopa", style: Theme.of(context).textTheme.headline6),
              DropdownButton(
                value: _sopa, //id
                items: categoriasMenu["Sopas"]
                    .map<DropdownMenuItem<int>>((int s) => DropdownMenuItem(
                        value: s, child: Text(menuItems[s]["nombre"])))
                    .toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    _sopa = newValue!;
                    print(_sopa);
                  });
                },
              ),

              //Plato fuerte
              Container(height: 24),
              Text("Plato Fuerte",
                  style: Theme.of(context).textTheme.headline6),
              DropdownButton(
                value: _fuerte, //id
                items: categoriasMenu["Platos Fuertes"]
                    .map<DropdownMenuItem<int>>((int s) => DropdownMenuItem(
                        value: s, child: Text(menuItems[s]["nombre"])))
                    .toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    _fuerte = newValue!;
                    print(_fuerte);
                  });
                },
              ),

              //Bebida
              Container(height: 24),
              Text("Bebida", style: Theme.of(context).textTheme.headline6),
              DropdownButton(
                value: _bebida, //id
                items: categoriasMenu["Bebidas"]
                    .map<DropdownMenuItem<int>>((int s) => DropdownMenuItem(
                        value: s, child: Text(menuItems[s]["nombre"])))
                    .toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    _bebida = newValue!;
                    print(_bebida);
                  });
                },
              ),

              //Sopa
              Container(height: 24),
              Text("Postre", style: Theme.of(context).textTheme.headline6),
              DropdownButton(
                value: _postre, //id
                items: categoriasMenu["Postres"]
                    .map<DropdownMenuItem<int>>((int s) => DropdownMenuItem(
                        value: s, child: Text(menuItems[s]["nombre"])))
                    .toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    _postre = newValue!;
                    print(_postre);
                  });
                },
              ),
            ],
          ),
        ));
  }

  Widget dropdown(String categoria, int _var) {
    return DropdownButton(
      value: _var, //id
      items: categoriasMenu[categoria]
          .map<DropdownMenuItem<int>>((int s) =>
              DropdownMenuItem(value: s, child: Text(menuItems[s]["nombre"])))
          .toList(),
      onChanged: (int? newValue) {
        setState(() {
          _var = newValue!;
          print(_var);
        });
      },
    );
  }
}
