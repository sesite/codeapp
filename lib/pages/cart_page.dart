import 'package:codeapp/models/cart.dart';
import 'package:codeapp/widgets/cart_item_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина покупок'),
      ),
      body: cartData.cartItems.isEmpty
          ? Card(
              elevation: 5.0,
              margin: const EdgeInsets.all(30.0),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Center(
                  child: StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return Text('Корзина пуста');
                      }),
                ),
              ),
            )
          : Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      cartData.cartItems.length.toString() +
                          'Стоимость: ' +
                          cartData.totalAmount.toStringAsFixed(2),
                      style: TextStyle(fontSize: 20.0),
                    ),
                    MaterialButton(
                      onPressed: () {
                        cartData.clear();
                      },
                      color: Theme.of(context).primaryColor,
                      child: Text('Купить'),
                    ),
                  ],
                ),
                Divider(),
                Expanded(
                  child: CartItemList(cartData: cartData),
                ),
              ],
            ),
    );
  }
}
