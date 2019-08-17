import 'package:flutter/material.dart';

class CardC extends StatefulWidget {
  @override
  _CardCState createState() => _CardCState();
}

class _CardCState extends State<CardC>{
  double offset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: GestureDetector(
        onVerticalDragStart: (DragStartDetails details){
          setState(() {
            offset = details.localPosition.dy;
          });  
        },
        onVerticalDragUpdate: (DragUpdateDetails details){
          setState(() {
            offset = details.localPosition.dy;
          });                

          if(details.localPosition.dy >= 400){
            setState(() {
              offset = 400;
            }); 
          } else if(details.localPosition.dy <= 12){
            setState(() {
              offset = 0;
            });   
          }
        },
        child: Transform.translate(
          offset: Offset(0, offset),
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
  }
}
