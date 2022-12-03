// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../providers/productsProviders.dart';
import '../widgets/product_grid.dart';

enum Filters {
  favorites,
  showAll,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavoutites = false;
  @override
  Widget build(BuildContext context) {
    // final productContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My shop app'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: Filters.favorites,
                child: Text("Favorites"),
              ),
              const PopupMenuItem(
                value: Filters.showAll,
                child: Text("Show all"),
              ),
            ],
            icon: const Icon(Icons.more_vert),
            onSelected: (Filters selectedValue) {
              setState(() {
                if (selectedValue == Filters.favorites) {
                  // productContainer.showFavourites();
                  _showFavoutites = true;
                } else {
                  // productContainer.showAll();
                  _showFavoutites = false;
                }
              });
            },
          )
        ],
      ),
      body: ProductGrid(_showFavoutites),
    );
  }
}
