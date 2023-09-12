// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';

class RoundButton extends StatefulWidget {
  RoundButton({required this.text, required this.func, super.key});
  String text;
  VoidCallback func;

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.func,
      child: Container(
        height: size.height * .05,
        width: size.width,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
            vertical: size.width * .05, horizontal: size.width * .1),
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(size.width * .1)),
        child: Text(
          widget.text,
          style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: size.width * .06,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
