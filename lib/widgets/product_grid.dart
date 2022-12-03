// ignore_for_file: use_key_in_widget_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/productsProviders.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFav;
  const ProductGrid(this.showFav);
  @override
  Widget build(BuildContext context) {
    final productObject = Provider.of<Products>(context);

    final loadedProducts =
        showFav ? productObject.favItems : productObject.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2.5,
        ),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: loadedProducts[i],
              // create: (c) => loadedProducts[i],
              child: const ProductItem(
                  // loadedProducts[i].id,
                  // loadedProducts[i].imageUrl,
                  // loadedProducts[i].title,
                  // loadedProducts[i].price,
                  ),
            ));
  }
}
