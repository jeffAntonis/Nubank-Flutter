import 'package:flutter/material.dart';
import 'package:nubank/models/Item.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({ this.item });
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromRGBO(255, 255, 255, 0.8),
              width: 1,
            ),
          ),          
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                IconData(item.codIcon, fontFamily: 'MaterialIcons'),
                color: Colors.white,
                size: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
