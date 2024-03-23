// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:rakshak_sos/view/user/quiz/question.dart';
import 'package:rakshak_sos/view/user/quiz/result.dart';

import 'answer.dart';

class Quiz extends StatefulWidget {
  final List<Map<String, Object>> questions;
  int questionIndex;
  final Function answerQuestion;
  int totalScore;
  VoidCallback? resetQuiz;
  Quiz(
      {Key? key,
      required this.questions,
      required this.questionIndex,
      required this.answerQuestion,
      required this.totalScore,
      this.resetQuiz})
      : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          widget.questions[widget.questionIndex]['questionText'].toString(),
        ),
        ...(widget.questions[widget.questionIndex]['answers']
                as List<Map<String, Object>>)
            .map((answer) {
          return InkWell(
            onTap: () async {
              if (widget.questionIndex < widget.questions.length - 1) {
                setState(() {
                  widget.questionIndex += 1;
                });
              } else {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(),
                  ),
                );
              }
            },
            child: Answer(() => widget.answerQuestion(answer['score']),
                answer['text'].toString()),
          );
        }).toList()
      ],
    );
  }
}
