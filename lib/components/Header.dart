import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 0,
        right: 0,
        bottom: 30,
      ),
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('lib/assets/Nubank_Logo.png'),
                Container(
                  margin: EdgeInsets.only(
                    left: 8,
                  ),
                  child: Text(
                    'Jefferson',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Icon(
              IconData(58131, fontFamily: 'MaterialIcons'),
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
