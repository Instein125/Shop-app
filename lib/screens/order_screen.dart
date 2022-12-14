import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '/widgets/app_drawer.dart';
import '/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "/order";
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Your Orders")),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: ((context, index) => OrderItem(orderData.orders[index])),
      ),
    );
  }
}
