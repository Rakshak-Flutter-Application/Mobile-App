import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class Result extends StatelessWidget {
  // final int resultScore;
  // VoidCallback resetHandler;
  Result(
      // this.resultScore, this.resetHandler,
      {Key? key})
      : super(key: key);

  // String get resultPhrase {
  //   String resultText;
  //   if (resultScore >= 41) {
  //     resultText = 'You are awesome!';
  //     print(resultScore);
  //   } else if (resultScore >= 31) {
  //     resultText = 'Pretty likeable!';
  //     print(resultScore);
  //   } else if (resultScore >= 21) {
  //     resultText = 'You need to work more!';
  //   } else if (resultScore >= 1) {
  //     resultText = 'You need to work hard!';
  //   } else {
  //     resultText = 'This is a poor score!';
  //     print(resultScore);
  //   }
  //   return resultText;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/win.gif"),
            Text(
              // resultPhrase,
              '4/4',
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, RoutesName.quizzes),
              child: Container(
                color: Color.fromRGBO(158, 169, 255, 1.0),
                padding: const EdgeInsets.all(14),
                child: const Text(
                  'Restart Quiz',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RoutesName.user_home),
              child: Container(
                color: Color.fromRGBO(158, 169, 255, 1.0),
                padding: const EdgeInsets.all(14),
                child: const Text(
                  'Home Page',
                  style: TextStyle(color: AppColors.textColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
