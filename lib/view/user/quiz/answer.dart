import 'dart:developer';

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectHandler(),
        style: ButtonStyle(
            textStyle:
                MaterialStateProperty.all(const TextStyle(color: Colors.white)),
            backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(158, 169, 255, 1.0))),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            answerText,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
