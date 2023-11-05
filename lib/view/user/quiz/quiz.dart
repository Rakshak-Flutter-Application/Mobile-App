import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/view/user/quiz/quizz.dart';
import 'package:rakshak_sos/view/user/quiz/result.dart';

class QuizIt extends StatefulWidget {
  const QuizIt({super.key});

  @override
  State<QuizIt> createState() => _QuizItState();
}

class _QuizItState extends State<QuizIt> {
  final _questions = const [
    {
      'questionText':
          'Q1. You look out your window and see a tornado approaching. There is no tornado shelter nearby. Do you ?',
      'answers': [
        {
          'text': 'Go outside and try to get a close-up photo of the tornado',
          'score': 0
        },
        {'text': 'Get in your car and from the tornado', 'score': 0},
        {'text': 'Hide in the basement of your house', 'score': 10},
        {
          'text':
              'Get inside the house and look out the window to see the tornado approaching',
          'score': 0
        },
      ],
    },
    {
      'questionText':
          'Q2. An alert comes saying a volcano is about to erupt nearby, but there is not enough time to evacuate the area. Do you ?',
      'answers': [
        {'text': 'Try to run for it anyway', 'score': 0},
        {
          'text':
              'Decide the volcano is not going to explode and go for a leisurely walk',
          'score': 0
        },
        {'text': 'Hide in a pit', 'score': 0},
        {'text': 'Barricade yourself inside your house', 'score': 10},
      ],
    },
    {
      'questionText':
          ' Q3.Including children in the family emergency planning process will only scare them, so it should be avoided at all costs.',
      'answers': [
        {'text': 'True', 'score': 0},
        {'text': 'False', 'score': 10},
      ],
    },
    {
      'questionText':
          'Q4. You are hiking in the mountains in snow season when suddenly the snow falls out from underneath you. Do you ?',
      'answers': [
        {'text': 'Grab a tree and hold on tight', 'score': 10},
        {'text': 'Pause in shock', 'score': 0},
        {'text': 'Pick up your hiking equipment and run', 'score': 0},
        {'text': 'Ignore it', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var totalScore = 0;

  _resetQuiz() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // setState(() {
    _questionIndex = 0;
    totalScore = 0;
    // });
  }
  // );
  // }

  void _answerQuestion(int score) {
    totalScore += score;
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // setState(() {
    _questionIndex += 1;
    // });
    // });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions with us");
    } else {
      print("No more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    log('qi>>>' + _questionIndex.toString());
    log('qL<<<' + _questions.length.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/logo.png",
              width: 50,
            ),
            Text(
              "  Quiz It",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(158, 169, 255, 1.0),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: _questionIndex < _questions.length - 1
            ? Quiz(
                answerQuestion: _answerQuestion,
                totalScore: totalScore,
                resetQuiz: _resetQuiz(),
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(),
      ),
    );
  }
}
