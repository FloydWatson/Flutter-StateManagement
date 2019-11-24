import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../providers/products_provider.dart';


enum FilterOptions {
  Favoutires,
  All,
}

class ProductOverviewScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

      // access ptoducts provider
  final productsContainer = Provider.of<ProductsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          // menu that opens up as an overlay
          // icon is display. item builder builds entries
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favoutires){
                productsContainer.showFavouritesOnly();
              } else {
                productsContainer.showAll();
              }
            },
            itemBuilder: (_) => [
              // needs to return a list of widgets
              // value is used as what was chosen
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: FilterOptions.Favoutires,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),
      // grid view here only renders objects on scrren at the time
      body: ProductsGrid(),
    );
  }
}
