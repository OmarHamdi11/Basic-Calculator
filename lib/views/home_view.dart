import 'dart:developer';

import 'package:calc/constants.dart';
import 'package:calc/widgets/calc_number_button.dart';
import 'package:calc/widgets/custom_button.dart';
import 'package:calc/widgets/results_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int firstNumber = 0, secondNumber = 0;
  String history = '', textToDisplay = '', res = '', operation = '';

  void buttonOnClick(String value) {
    log(value);
    if (value == 'C') {
      textToDisplay = '';
      firstNumber = 0;
      secondNumber = 0;
      res = '';
      history = '';
    } else if (value == '+' || value == '−' || value == '÷' || value == '×') {
      firstNumber = int.parse(textToDisplay);
      operation = value;
      res = '';
    } else if (value == '=') {
      secondNumber = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNumber + secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      } else if (operation == '−') {
        res = (firstNumber - secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      } else if (operation == '÷') {
        res = (firstNumber / secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      } else if (operation == '×') {
        res = (firstNumber * secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
    } else if (value == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-$textToDisplay';
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (value == 'D') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else {
      res = int.parse(textToDisplay + value).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ResultsSection(
            history: history,
            textToDisplay: textToDisplay,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalcNumberButton(
                    text: 'C',
                    buttonColor: Colors.amber,
                    callBack: buttonOnClick,
                  ),
                  CalcNumberButton(
                    text: '√',
                    buttonColor: lightamberColor,
                    callBack: buttonOnClick,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '7',
                    buttonColor: lightwhiteColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '4',
                    buttonColor: lightwhiteColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '1',
                    buttonColor: lightwhiteColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '.',
                    buttonColor: lightwhiteColor,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '(',
                    buttonColor: lightamberColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '%',
                    buttonColor: lightamberColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '8',
                    buttonColor: lightwhiteColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '5',
                    buttonColor: lightwhiteColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '2',
                    buttonColor: lightwhiteColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '0',
                    buttonColor: lightwhiteColor,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: ')',
                    buttonColor: lightamberColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '+/-',
                    buttonColor: lightamberColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '9',
                    buttonColor: lightwhiteColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '6',
                    buttonColor: lightwhiteColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '3',
                    buttonColor: lightwhiteColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: 'D',
                    buttonColor: const Color(0xffE7E9ED),
                  ),
                ],
              ),
              Column(
                children: [
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '×',
                    buttonColor: lightPurbilColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '÷',
                    buttonColor: lightPurbilColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '−',
                    buttonColor: lightPurbilColor,
                  ),
                  CalcNumberButton(
                    callBack: buttonOnClick,
                    text: '+',
                    buttonColor: lightPurbilColor,
                  ),
                  CustomButton(
                    callBack: buttonOnClick,
                    text: '=',
                    buttonColor: purbilColor,
                    height: 155,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
