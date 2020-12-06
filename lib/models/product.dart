import 'dart:collection';

import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String desc;
  final String imgUrl;
  final num price;
  final Color color;

  Product(
      {@required this.id,
      @required this.title,
      @required this.desc,
      @required this.imgUrl,
      @required this.price,
      @required this.color});
}

class ProductDataProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: '1',
        title: 'Пинаколада',
        desc: 'Традиционный карибский алкогольный коктейль',
        imgUrl:
            'https://vzboltay.com/uploads/posts/2015-03/1427122366_pina-colada.jpg',
        price: 150.0,
        color: Colors.blue[100]),
    Product(
        id: '2',
        title: 'Санта-Мария',
        desc: 'Вкус детства',
        imgUrl: 'http',
        price: 150.0,
        color: Colors.green[200]),
    Product(
        id: '3',
        title: 'Б-52',
        desc: 'Вкус детства',
        imgUrl: 'http',
        price: 150.0,
        color: Colors.lime[200]),
    Product(
        id: '4',
        title: 'Секс на пляже',
        desc: 'Вкус детства',
        imgUrl: 'http',
        price: 150.0,
        color: Colors.orange[200]),
    Product(
        id: '5',
        title: 'Шторм',
        desc: 'Вкус детства',
        imgUrl: 'http',
        price: 150.0,
        color: Colors.blue[200]),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);
  Product getElementById(String id) =>
      _items.singleWhere((element) => element.id == id);
}
