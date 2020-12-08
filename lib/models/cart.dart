import 'dart:collection';

import 'package:flutter/widgets.dart';

class Cart {
  final String id;
  final String title;
  final int number;
  final num price;
  final String imgUrl;
  Cart({this.id, this.title, this.number, this.price, this.imgUrl});
}

class CartDataProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  UnmodifiableMapView<String, Cart> get cartItems =>
      UnmodifiableMapView(_cartItems);

  int get cartItemCount => _cartItems.length;

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.number;
    });
    return total;
  }

  void addItem({productId, price, title, imgUrl}) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (value) => Cart(
            id: value.id,
            title: value.title,
            price: value.price,
            imgUrl: value.imgUrl,
            number: value.number + 1),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => Cart(
            id: '${DateTime.now()}',
            title: title,
            price: price,
            imgUrl: imgUrl,
            number: 1),
      );
    }
    notifyListeners();
  }

  void deleteItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

//Обновить корзину товара на +1
  void updateItemsAddOne(String productId) {
    _cartItems.update(
        productId,
        (value) => Cart(
            id: value.id,
            title: value.title,
            price: value.price,
            imgUrl: value.imgUrl,
            number: value.number + 1));
    notifyListeners();
  }

//Обновить корзину товара на -1
  void updateItemsSubOne(String productId) {
    _cartItems.update(
        productId,
        (value) => Cart(
            id: value.id,
            title: value.title,
            price: value.price,
            imgUrl: value.imgUrl,
            number: value.number - 1));
    notifyListeners();
  }

  void clear() {
    _cartItems.clear();
    notifyListeners();
  }
}
