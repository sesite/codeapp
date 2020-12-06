import 'package:codeapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: product.color,
      ),
      child: Column(
        children: [
          Container(
            child: Text('${product.title}'),
          )
        ],
      ),
    );
  }
}
