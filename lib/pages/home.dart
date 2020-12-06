import 'package:codeapp/models/product.dart';
import 'package:codeapp/widgets/item_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('CodeApp'),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 92,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Container(
                child: ListTile(
                  title: Text(
                    'Безалкагольные напитки',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'более 100 наименований',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(Icons.panorama_horizontal),
                ),
              ),
              Container(
                height: 280,
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productData.items.length,
                  itemBuilder: (context, int index) =>
                      ChangeNotifierProvider.value(
                    value: productData.items[index],
                    child: ItemCart(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Каталог напитков',
                  style: TextStyle(
                    //fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text('Список каталогов'),
              ),
            ],
          ),
        ),
      ),
      // ! ботом бар
    );
  }
}
