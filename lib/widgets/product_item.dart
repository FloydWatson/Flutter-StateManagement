import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // cliprrect used to add rounded corners. wrapping widegets that dont have border radius in these allows you to have access to border radius
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // gesture detector allows us to make the image clickable
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(''
              
            );
          },
          child: Image.network(
            imageUrl,
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
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {},
          ),
          title: Text(
            title,
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
