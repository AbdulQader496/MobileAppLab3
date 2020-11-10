import 'package:flutter/material.dart';
import './quiz.dart';
import './answer.dart';
import './result.dart';

void main() {
  runApp(My2ndApp());
}

class My2ndApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //TODO: implement createState
    return _My2ndAppState();
  }
}

class _My2ndAppState extends State<My2ndApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'Whats\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 1}
      ],
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 5},
        {'text': 'Max', 'score': 3},
        {'text': 'weew', 'score': 1}
      ],
    },
    {
      'questionText': 'Who\'s your favourite food?',
      'answers': [
        {'text': 'rice and chicken', 'score': 10},
        {'text': 'fish ', 'score': 5},
        {'text': 'veg and things', 'score': 3},
        {'text': 'things and things', 'score': 1}
      ],
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
    //var aBool = true;
    //var aBool = false;

    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    //var dummy = const ['Hello'];
    //dummy.add('Max');
    //print(dummy);
    //dummy = [];
    //questions = []; doesn't work if questions is const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My @nd App'),
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
