import 'package:calculadora_imc/pages/calculadora_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData.dark().copyWith(
        primaryColor: kBackgroundColor,
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kBackgroundColor,
        ),
      ),
      home: CalculadoraPage(),
    );
  }
}
