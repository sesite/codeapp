import 'package:codeapp/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);

    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.amberAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 + 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cartData.cartItems.length,
                itemBuilder: (context, index) {
                  return Hero(
                    tag: cartData.cartItems.values.toList()[index].imgUrl,
                    child: GestureDetector(
                      onTap: () {
                        //! page coctail
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 35.0,
                            height: 35.0,
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 4.0,
                                  spreadRadius: 5.0,
                                  offset: Offset(-2, 2),
                                ),
                              ],
                              image: DecorationImage(
                                image: NetworkImage(cartData.cartItems.values
                                    .toList()[index]
                                    .imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            /* child: Icon(
                              Icons.star,
                              color: Colors.transparent,
                            ), */
                          ),
                          Positioned(
                            right: 2.0,
                            bottom: 5.0,
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 16.0,
                                minHeight: 16.0,
                              ),
                              child: Text(
                                '${cartData.cartItems.values.toList()[index].number}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 50.0,
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(cartData.totalAmount.toStringAsFixed(2)),
                  IconButton(
                    onPressed: () {
                      //! to cart
                    },
                    icon: Icon(Icons.shopping_bag),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
