import 'package:flutter/material.dart';

class CatalogListTile extends StatelessWidget {
  final String img;

  const CatalogListTile({Key key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //!=
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text('Освежающий напиток в летнюю жару'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('09.00-10.00'),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.yellow,
                  ),
                  Text('4.8'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
