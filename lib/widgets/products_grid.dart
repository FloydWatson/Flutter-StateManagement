import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // set up provider listener. change of method to tell it to listen to instance created in main
    final productsData = Provider.of<ProductsProvider>(context);

    // getting product list [] from provider
    final products = productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(
          10.0), // set const to make sure it does not rebuild. saves performance
      itemCount: products.length,
      // item builder is what we will see on the screen. listening to product
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        // products[i] returns single product item as it is stored in ProductsProvider
        builder: (c) => products[i],
        child: ProductItem(
          
        ),
      ),
      // how grid will be structured. cross axis allows us to define number of coloumns, aspect ratio = bit taller then they are wide. 3 / 2
      // cross axis spacing = gutering between items, main axis spacing = space between rows
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
