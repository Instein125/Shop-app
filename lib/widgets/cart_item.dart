// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final int quantity;
  final double price;
  final String title;

  const CartItem(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red[400],
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: ((direction) =>
          Provider.of<Cart>(context, listen: false).removeItem(productId)),
      child: Card(
        color: Colors.blue[200],
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                child: FittedBox(child: Text("\$$price")),
              ),
              title: Text(title),
              subtitle: Text("\$${(price * quantity)}"),
              trailing: Text("$quantity x"),
            )),
      ),
    );
  }
}
