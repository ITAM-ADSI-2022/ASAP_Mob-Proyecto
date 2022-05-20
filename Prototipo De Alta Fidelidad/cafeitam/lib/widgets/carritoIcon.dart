import 'package:cafeitam/carrito.dart';
import 'package:cafeitam/utils/functionality.dart';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart';

class CarritoIconButton extends StatelessWidget {
  final Map items;
  final Function f;

  const CarritoIconButton({Key? key, required this.items, required this.f})
      : super(key: key);

  Widget build(BuildContext context) {
    return IconButton(
      icon: Badge(
        badgeColor: Colors.white,
        showBadge: this.items.length > 0,
        badgeContent: Text("${this.items.length}"),
        child: Icon(Icons.shopping_cart),
      ),
      onPressed: () async {
        await goto(context, CarritoPage());
        this.f();
      },
    );
  }
}
