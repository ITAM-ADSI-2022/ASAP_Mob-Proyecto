import 'package:cafeitam/data/actual.dart';
import 'package:cafeitam/data/menuCategorias.dart';
import 'package:cafeitam/data/menuData.dart';
import 'package:cafeitam/detalles.dart';
import 'package:cafeitam/utils/functionality.dart';
import 'package:cafeitam/widgets/tappableCard.dart';
import 'package:flutter/material.dart';

Widget menuDelDiaCard(Function onTap) {
  Map data = DatosActuales.menuDelDia;
  String descripcion = (menuItems[data["Sopas"]]["nombre"] +
          ", " +
          menuItems[data["Platos Fuertes"]]["nombre"] +
          ", " +
          menuItems[data["Bebidas"]]["nombre"] +
          " y " +
          menuItems[data["Postres"]]["nombre"] +
          ".")
      .toLowerCase();
  descripcion = descripcion[0].toUpperCase() + descripcion.substring(1);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TappableCardWithImages(
        cardWidth: double.infinity,
        cardHeight: 200,
        onTap: () => onTap(),
        images: [
          AssetImage("imagenes/" + menuItems[data["Sopas"]]["foto"]),
          AssetImage("imagenes/" + menuItems[data["Platos Fuertes"]]["foto"]),
          AssetImage("imagenes/" + menuItems[data["Bebidas"]]["foto"])
        ],
        imageHeightAsPercentage: 0.45,
        below: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              Container(
                height: 40,
                child: Text(
                  descripcion,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$$precioMenuDelDia"),
                  TextButton(
                      onPressed: () => onTap(), child: Text("Pedir Ahora")),
                ],
              )
            ],
          ),
        )),
  );
}

StatelessWidget pedidoCard(BuildContext context, Map data) {
  //Items pedidos
  List<String> items = [];
  for (int id in data["items"].keys)
    items.add(menuItems[id]["nombre"] +
        (data["items"][id] == 1 ? "" : "(x${data["items"][id]})"));
  //Title a partir de fecha
  String fecha =
      "${data["fecha"].day}/${data["fecha"].month}/${data["fecha"].year}";
  String title;
  if (isToday(data["fecha"])) {
    title = "Hoy " + data["horaDeEntrega"].format(context);
  } else {
    title = fecha;
  }

  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          ListTile(
              title: Text(title),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(items.join('\n')),
              ),
              trailing: Text("\$${data["total"]}")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: Text("Editar")),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          )
        ],
      ),
    ),
  );
}

Widget menuItemCard(Map data, double cardWidth, double cardHeight,
    BuildContext context, Function f) {
  return TappableCardWithImage(
    cardWidth: cardWidth,
    cardHeight: cardHeight,
    onTap: () async {
      await goto(context, Detalles(id: data["id"]));
      f();
    },
    image: AssetImage("imagenes/${data["foto"]}"),
    imageHeightAsPercentage: 0.6,
    below: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(data["nombre"],
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
          SizedBox(height: 4),
          Text(
            "\$${data["precio"]}",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ],
      ),
    ),
  );
}
