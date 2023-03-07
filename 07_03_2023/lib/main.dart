import 'package:flutter/material.dart';

import 'MyCard.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('../images/avatar.jpg'),
              radius: 60,
            ),
            Text(
              'Manoel Gomes',
              style: TextStyle(
                fontFamily: 'Pacifico',
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'MAIOR CANTOR',
              style: TextStyle(
                fontFamily: 'Pacifico',
                color: Colors.white54,
                fontSize: 18,
              ),
            ),
            MyCard(icone: Icons.phone, contato: '+55 11 9854398743'),
            MyCard(icone: Icons.email, contato: 'manoel@gmail.com'),
            MyCard(icone: Icons.phone, contato: '+55 11 9854398743'),
            MyCard(icone: Icons.email, contato: 'manoel@gmail.com'),
          ],
        ),
      ),
    );
  }
}
