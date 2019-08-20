import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:nubank/models/AppState.dart';
import 'package:nubank/store/action.dart' as action;

class CardC extends StatefulWidget {
  @override
  _CardCState createState() => _CardCState();
}

class _CardCState extends State<CardC> with SingleTickerProviderStateMixin {
  double offset = 0.0;
  bool prevState = false;
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      lowerBound: 0,
      upperBound: 400,
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    animation = Tween(begin: 0.0, end: 400.0).animate(controller)
      ..addListener(() {
        setState(() {
        });
      });

    controller.addListener(() {
      setState(() {
        offset = controller.value;
      });
    });
  }

  void startAnimation(bool value) async{
    if(value){
      await controller.forward();
    } else{
      await controller.reverse();
    }   

    new Future.delayed(Duration.zero, () => setState(() {
      prevState = value;
    }));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        if (state.animated != prevState) {
          startAnimation(state.animated);
        }
        return Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget child) {
              return Transform.translate(
                offset: Offset(0, offset),
                child: GestureDetector(
                  onPanUpdate: (DragUpdateDetails details) {

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
                  onPanEnd: (DragEndDetails details) async{
                    bool aux = false;

                    if(offset >= 20 && offset <= 400 && state.animated == false){
                      await controller.forward(from: offset);
                      aux = true;
                    } else if(offset <= 380 && state.animated == true){
                      await controller.reverse(from: offset);
                      aux = true;
                    }

                    if(aux){
                      StoreProvider.of<AppState>(context)
                        .dispatch(action.Action(type: 'ANIMATED', payload: !state.animated));
                    }
                  },
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
                                  'R\$ 999.999,99',
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
              );
            },
          ),
        );
      },
    );
  }
}
