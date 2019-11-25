import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartScreen extends StatelessWidget {

  // route
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {



    // getting cart provider
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                // adding space between elements
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  // spacer allows us to push space between widgets. it takes up all available space between
                  Spacer(),
                  // element with rounded corners used to display information
                  Chip(
                    label: Text(
                      // getting total from cart provider. to string is automatic. backslash dollar is to escape string and show dollar sign
                      '\$${cart.totalAmount}',
                      style: TextStyle(color: Theme.of(context).primaryTextTheme.title.color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('ORDER NOW'),
                    onPressed: () {},
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
