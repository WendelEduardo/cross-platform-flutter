import 'package:calculadora_imc/components/bottom_button.dart';
import 'package:calculadora_imc/components/custom_card.dart';
import 'package:calculadora_imc/components/icon_content.dart';
import 'package:calculadora_imc/components/roundicon_button.dart';
import 'package:calculadora_imc/constants.dart';
import 'package:flutter/material.dart';

import '../components/slider_altura.dart';

enum Genero {
  masculino,
  feminino,
}

class CalculadoraPage extends StatefulWidget {
  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  Genero? generoSelecionado;
  Color colorButtonMen = kInactiveCardColour;
  Color colorButtonWoman = kInactiveCardColour;
  int altura = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    onTapButton: () {
                      generoSelecionado = Genero.masculino;

                      setState(() {
                        if (generoSelecionado != null) {
                          colorButtonMen = kActiveCardColour;
                          colorButtonWoman = kInactiveCardColour;
                        }
                      });
                    },
                    color: colorButtonMen,
                    child: const IconContent(
                      icon: Icons.male,
                      label: 'Masculino',
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    onTapButton: () {
                      generoSelecionado = Genero.feminino;

                      setState(() {
                        if (generoSelecionado != null) {
                          colorButtonWoman = kActiveCardColour;
                          colorButtonMen = kInactiveCardColour;
                        }
                      });
                    },
                    color: colorButtonWoman,
                    child: const IconContent(
                      icon: Icons.female,
                      label: 'Feminino',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              color: kActiveCardColour,
              child: SliderAltura(
                altura: altura,
                onChangedSlider: (double novaAltura) {
                  setState(() {
                    altura = novaAltura.toInt();
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: kActiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'IDADE',
                          style: kLabelTextStyle,
                        ),
                        const Text(
                          '0',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            RoundIconButton(
                              icon: Icons.remove,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: kActiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'PESO',
                          style: kLabelTextStyle,
                        ),
                        const Text(
                          '0',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            RoundIconButton(
                              icon: Icons.remove,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const BottomButton(buttonTitle: 'Calcular IMC')
        ],
      ),
    );
  }
}
