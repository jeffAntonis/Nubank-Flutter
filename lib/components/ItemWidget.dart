import 'package:flutter/material.dart';
import 'package:nubank/models/Item.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({ this.item });
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            width: 1,
          ),
        ),          
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            IconData(item.codIcon, fontFamily: 'MaterialIcons'),
            color: Colors.white,
            size: 20,
          ),
          Text(
            item.title,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
