import 'dart:ffi';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "Wat is jouw favorite kleur?",
      "answers": [
        {"text": "Zwart", "score": 10},
        {"text": "Blauw", "score": 5},
        {"text": "Wit", "score": 3},
        {"text": "Rood", "score": 1}
      ],
    },
    {
      "questionText": "Wat is jouw favorite dier?",
      "answers": [
        {"text": "Hond", "score": 10},
        {"text": "Kat", "score": 5},
        {"text": "Leeuw", "score": 3},
        {"text": "Konijn", "score": 1}
      ],
    },
    {
      "questionText": "Hoe gaat het?",
      "answers": [
        {"text": "Goed", "score": 10},
        {"text": "Slecht", "score": 5},
        {"text": "Kan beter", "score": 3},
        {"text": "Helemaal prima", "score": 20}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  Void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("Wij hebben meer vragen!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ali Kashev"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}
