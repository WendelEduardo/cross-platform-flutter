import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {

  final IconData icone;
  final String contato;

  MyCard({required this.icone, required this.contato});

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(
              icone,
              color: Colors.lightBlue,
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              contato,
              style: TextStyle(color: Colors.lightBlue),
            ),
          ],
        ),
      ),
    );

  }
}
