import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';

class RoundButton extends StatefulWidget {
  RoundButton(
      {this.icon,
      this.width,
      required this.text,
      required this.func,
      super.key});
  String text;
  VoidCallback func;
  double? width;
  Widget? icon;

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    widget.width = widget.width ?? size.width * .5;
    return InkWell(
      onTap: widget.func,
      child: Container(
        height: size.height * .05,
        width: widget.width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: size.width * .05),
        margin: EdgeInsets.symmetric(
            vertical: size.width * .05, horizontal: size.width * .1),
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 214, 255, 1.0),
            borderRadius: BorderRadius.circular(size.width * .1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                  // color: AppColors.generalColor,
                  fontSize: size.width * .06,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
