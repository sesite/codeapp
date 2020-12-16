import 'package:codeapp/models/cart.dart';
import 'package:codeapp/models/product.dart';
import 'package:codeapp/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  final String itemid;

  const ItemPage({Key key, this.itemid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ProductDataProvider>(context).getElementById(itemid);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            data.title,
            style: GoogleFonts.marmelad(),
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Hero(
                tag: data.imgUrl,
                child: Container(
                  height: 480,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5.0,
                margin: const EdgeInsets.symmetric(
                    horizontal: 35.0, vertical: 10.0),
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Text(
                        data.title,
                        style: TextStyle(fontSize: 26.0),
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'Цена: ',
                            style: TextStyle(fontSize: 24.0),
                          ),
                          Text(
                            '${data.price}',
                            style: TextStyle(fontSize: 24.0),
                          ),
                        ],
                      ),
                      Divider(),
                      Text(data.desc),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Provider.of<CartDataProvider>(context)
                              .cartItems
                              .containsKey(itemid)
                          ? Column(
                              children: [
                                MaterialButton(
                                  color: Colors.lightGreenAccent,
                                  child: Text('Перейти в корзину'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CartPage(),
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  'Товар уже добавлен в корзину',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.blueGrey),
                                ),
                              ],
                            )
                          : MaterialButton(
                              color: Colors.amberAccent,
                              child: Text('Добавить в корзину'),
                              onPressed: () {
                                Provider.of<CartDataProvider>(context,
                                        listen: false)
                                    .addItem(
                                        productId: data.id,
                                        imgUrl: data.imgUrl,
                                        title: data.title,
                                        price: data.price);
                              },
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
