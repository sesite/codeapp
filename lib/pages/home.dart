import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: Text('Горизонтальный список карточек'),
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
