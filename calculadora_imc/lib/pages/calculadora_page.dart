import 'package:calculadora_imc/constants.dart';
import 'package:flutter/material.dart';
import '../components/custom_card.dart';
import '../components/icon_content.dart';

class CalculadoraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calcular IMC'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
                        child:
                            IconContent(icon: Icons.male, text: 'Masculino')),
                  ),
                  Expanded(
                    child: CustomCard(
                      child: CustomCard(
                          child: IconContent(
                              icon: Icons.female, text: 'Feminino')),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Altura',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '1.83',
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(value: 0, onChanged: (double value) {})
                ],
              )),
            ),
            Expanded(
              child: CustomCard(child: Placeholder()),
            ),
          ],
        ));
  }
}
