import 'package:cafeitam/data/menuData.dart';
import 'package:cafeitam/data/usuariosData.dart';
import 'package:flutter/material.dart';

Widget ordenTile(
    BuildContext context, Map data, Function check, Function cancel) {
  print(data);
  List<String> items = [];
  for (int id in data["items"].keys)
    items.add(menuItems[id]["nombre"] +
        (data["items"][id] == 1 ? "" : "(x${data["items"][id]})"));

  String comentario = data["comentario"];
  String nombre = usuariosData[data["idPidio"]]["nombre"];
  String cu = usuariosData[data["idPidio"]]["cu"];
  return ListTile(
    title: Text("#${data["folio"]}: " + items.join(", ")),
    subtitle: Text(
        "${nombre} (${cu}). ${data["comentario"].isEmpty ? '' : 'Comentario: $comentario'}"),
    trailing: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(data["horaDeEntrega"].format(context))),
        IconButton(
            onPressed: () => check(data["folio"]), icon: Icon(Icons.check)),
        IconButton(
            onPressed: () => cancel(data["folio"]), icon: Icon(Icons.cancel)),
      ],
    ),
  );
}
