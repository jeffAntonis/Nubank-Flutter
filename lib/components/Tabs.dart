import 'package:flutter/material.dart';

import 'package:nubank/models/Item.dart';

class Tabs extends StatelessWidget {
  final List<Item> items = [
    Item(title: 'Indicar amigos', codIcon: 59390),
    Item(title: 'Cobrar', codIcon: 57547),
    Item(title: 'Depositar', codIcon: 58843),
    Item(title: 'Transferir', codIcon: 58840),
    Item(title: 'Bloquear cartão', codIcon: 59543),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: ListView.builder(
        padding: EdgeInsets.only(
          left: 10,
          right: 20,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color.fromRGBO(255, 255, 255, 0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      IconData(items[index].codIcon, fontFamily: 'MaterialIcons'),
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      items[index].title,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
