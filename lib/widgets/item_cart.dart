import 'package:codeapp/models/cart.dart';
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
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                //! навигации детэил
              },
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: NetworkImage(product.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              child: Text(
                '${product.title}',
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${product.price}'),
                  IconButton(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.black45,
                    ),
                    onPressed: () {
                      Provider.of<CartDataProvider>(context, listen: false)
                          .addItem(
                        productId: product.id,
                        price: product.price,
                        title: product.title,
                        imgUrl: product.imgUrl,
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
