import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/productsProviders.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productObject = Provider.of<Products>(context);
    final loadedProducts = productObject.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2.5,
        ),
        itemBuilder: (ctx, i) => ProductItem(
              loadedProducts[i].id,
              loadedProducts[i].imageUrl,
              loadedProducts[i].title,
              loadedProducts[i].price,
            ));
  }
}
