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
    return Positioned(
      top: -15,
      left: 0,
      right: 0,
      bottom: 100,
      child: Container(
        margin: EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: QrImage(
                  data: text,
                  size: 90,
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF8B10AE),
                ),
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
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ItemWidget(item: Item(title: 'Me ajuda', codIcon: 59645)),
                  ItemWidget(item: Item(title: 'Perfil', codIcon: 59391)),
                  ItemWidget(
                      item: Item(title: 'Configurar cartão', codIcon: 59504)),
                  ItemWidget(
                      item:
                          Item(title: 'Configurações do app', codIcon: 58156)),

                  //BUTTON
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 12,
                      ),
                      child: OutlineButton(
                        child: Text(
                          'SAIR DO APP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        onPressed: () {},
                        borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 0.8),
                          width: 1,
                        ),
                      ),
                    ),
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
