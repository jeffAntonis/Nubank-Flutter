import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:nubank/models/AppState.dart';
import 'package:nubank/store/action.dart' as action;

class CardC extends StatefulWidget {
  @override
  _CardCState createState() => _CardCState();
}

class _CardCState extends State<CardC> {
  double offset = 0.0;
  bool animated = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Transform.translate(
            offset: Offset(0, offset),
            child: GestureDetector(
              onPanUpdate: (DragUpdateDetails details) {
                if (animated) return;

                if (offset == 0 && details.delta.dy <= 0.33) {
                  setState(() {
                    offset = 0;
                  });
                  return;
                }

                var postition = details.globalPosition.dy;

                setState(() {
                  offset = offset + details.delta.dy;
                });

                if (postition >= 580) {
                  setState(() {
                    offset = 400;
                  });
                } else if (postition <= 170) {
                  setState(() {
                    offset = 0;
                  });
                }
              },
              // onVerticalDragStart: (DragStartDetails details) {
              //   setState(() {
              //     offset = details.globalPosition.dy - (MediaQuery.of(context).size.height * 0.2);
              //   });
              // },
              // onVerticalDragUpdate: (DragUpdateDetails details) {
              //   var aux = details.globalPosition.dy - (MediaQuery.of(context).size.height * 0.2);

              //   setState(() {
              //     offset = aux;
              //   });

              //   if (aux >= 400) {
              //     setState(() {
              //       offset = 400;
              //     });
              //   } else if (aux <= 12) {
              //     setState(() {
              //       offset = 0;
              //     });
              //   }
              // },
              child: Card(
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //CARD HEADER
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            IconData(57895, fontFamily: 'MaterialIcons'),
                            color: Color(0xFF666666),
                            size: 28,
                          ),
                          Icon(
                            IconData(59637, fontFamily: 'MaterialIcons'),
                            color: Color(0xFF666666),
                            size: 28,
                          ),
                        ],
                      ),
                    ),
                    //CARD CONTENT
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.12,
                        bottom: MediaQuery.of(context).size.height * 0.12,
                        left: 30,
                        right: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Saldo disponível',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF999999),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 3,
                            ),
                            child: Text(
                              'R\$ 197.611,65',
                              style: TextStyle(
                                fontSize: 32,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //CARD FOOTER
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFeeeeee),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          'Transferência de R\$ 20,00 recebida de Jefferson Antonis hoje às 06:00h',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
