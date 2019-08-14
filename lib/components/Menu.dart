import 'package:flutter/material.dart';
import 'package:nubank/components/ItemWidget.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:nubank/models/Item.dart';

class Menu extends StatelessWidget {
  final String text = '123456';

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
      margin: EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: QrImage(
              data: text,
              size: 80,
              foregroundColor: Colors.white70,
              backgroundColor: Color(0xFF8B10AE),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 30,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: <Widget>[
                ItemWidget(item: Item(title: 'Me ajuda', codIcon: 59645)),
                ItemWidget(item: Item(title: 'Perfil', codIcon: 59391)),
                ItemWidget(item: Item(title: 'Configurar cartão', codIcon: 59504)),
                ItemWidget(item: Item(title: 'Configurações do app', codIcon: 58156)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
