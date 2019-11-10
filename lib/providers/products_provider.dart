import 'package:flutter/material.dart';

import '../model/product.dart';

// using mixin. like inheritence
class ProductsProvider with ChangeNotifier {
  // underscore = private property
  List<Product> _items = [];

  // if just list is returned then you get a pointer to that list, a Reference of it
  List<Product> get items{
    // Spread operator
    return [..._items];
  }

// widgets listening can see list has been edited. then call for new list at rebuild trigger
  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}