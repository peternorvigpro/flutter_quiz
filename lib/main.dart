import 'package:flutter/material.dart';

import 'package:my_app/quiz.dart';
import 'package:my_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'quest1',
      'answers': [
        {'text': 'Blank', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Blue', 'score': 3},
      ]
    },
    {
      'questionText': 'quest2',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 2},
        {'text': 'Lion', 'score': 3},
      ]
    },
    {
      'questionText': 'quest3',
      'answers': [
        {'text': 'John', 'score': 1},
        {'text': 'Peter', 'score': 2},
        {'text': 'Max', 'score': 3},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
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
