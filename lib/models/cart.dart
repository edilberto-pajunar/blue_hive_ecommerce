import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = [
    // [itemName, itemPrice, imagePath, color]
    ["Top", "4.00", tNewCategoryWomen, tGray],
    ["Jacket", "4.00", tNewCategoryWomen3, tGray],
    ["Polo", "4.00", tNewCategoryWomen2, tGray],
    ["Crop Top", "4.00", tNewCategoryKid, tGray],
  ];

  get shopItems => _shopItems;

  // list of cart items
  List _cartItems = [];

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

  get cartItems => _cartItems;
}
