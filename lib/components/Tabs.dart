import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:nubank/models/AppState.dart';

import 'package:nubank/models/Item.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final List<Item> items = [
    Item(title: 'Indicar amigos', codIcon: 59390),
    Item(title: 'Cobrar', codIcon: 57547),
    Item(title: 'Depositar', codIcon: 58843),
    Item(title: 'Transferir', codIcon: 58840),
    Item(title: 'Bloquear cartão', codIcon: 59543),
  ];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: !state.animated ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            child: Container(
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
                          left: 5,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              IconData(
                                items[index].codIcon,
                                fontFamily: 'MaterialIcons',
                              ),
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
            ),
          ),
        );
      },
    );
  }
}
