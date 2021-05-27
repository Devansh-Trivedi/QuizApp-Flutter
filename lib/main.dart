import 'dart:ffi';

import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 5},
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 7},
        {'text': 'White', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Horse', 'score': 5},
        {'text': 'Zebra', 'score': 8},
        {'text': 'Lion', 'score': 7},
        {'text': 'Tiger', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your lucky number ?',
      'answers': [
        {'text': '8', 'score': 5},
        {'text': '4', 'score': 8},
        {'text': '7', 'score': 7},
        {'text': '9', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Horse', 'score': 5},
        {'text': 'Zebra', 'score': 8},
        {'text': 'Lion', 'score': 7},
        {'text': 'Tiger', 'score': 10}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    } else {
      print("No more questions !!");
    }
  }

  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
