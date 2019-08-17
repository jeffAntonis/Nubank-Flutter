import 'package:flutter/material.dart';

import 'package:nubank/components/Header.dart';
import 'package:nubank/components/Menu.dart';
import 'package:nubank/components/Tabs.dart';
import 'package:nubank/components/Card.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF8B10AE)),
        child: Column(          
          children: <Widget>[
            Header(),
            Expanded(
              flex: 1,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Menu(),
                  Tabs(),
                  CardC(),
                ],
              ),
            ),            
          ],
        ),
      ),
    );
  }
}
