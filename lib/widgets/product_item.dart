import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // getting products from parent widget. 
    final product = Provider.of<Product>(context);

    // cliprrect used to add rounded corners. wrapping widegets that dont have border radius in these allows you to have access to border radius
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // gesture detector allows us to make the image clickable
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            // box fit stretches image over availible space
            fit: BoxFit.cover,
          ),
        ),
        // adds bar at botom of grid tile
        footer: GridTileBar(
          // black 54 opaque black
          backgroundColor: Colors.black87,
          // leading defines widget placed on the atart of bar
          leading: IconButton(
            // set icon to favourite true / false
            icon: Icon(product.favourite ?  Icons.favorite : Icons.favorite_border,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              // call proviser method to set favourite
              product.toggleFavouriteStatus();
            },
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
