import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  CartItem(this.id, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            // fitted box makes text fit into the circle avatar
            child: Padding(
              padding: EdgeInsets.all(5),
                          child: FittedBox(
                child: Text('\$$price'),
              ),
            ),
          ),
          title: Text('$title'),
          // calculate subtotal in string interpolation
          subtitle: Text('Total: \$${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
