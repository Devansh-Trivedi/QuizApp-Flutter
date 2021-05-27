import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalResult;
  final Function reserHandler;

  Result(this.finalResult, this.reserHandler);
  String get resultPhrase {
    String resultText;
    if (finalResult <= 8) {
      resultText = 'You are awesome !!';
    } else if (finalResult <= 12) {
      resultText = 'Pretty Likable :)';
    } else if (finalResult <= 18) {
      resultText = 'It\'s satisfactory :(';
    } else {
      resultText = 'You are... bad :-(';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          OutlineButton(
            onPressed: reserHandler,
            child: Text('Restart Quiz'),
          )
        ],
      ),
    );
  }
}
