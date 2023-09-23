import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/res/components/otp_form.dart';
import 'package:rakshak_sos/res/components/round_button.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

// ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  String phoneNumber;
  OTPScreen({required this.phoneNumber, super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int resendTimer = 90; // Resend timer in seconds
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (resendTimer > 0) {
          resendTimer--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final number = widget.phoneNumber.substring(5, 9);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .05, vertical: size.width * .1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verification code",
                style: TextStyle(
                    fontSize: size.width * .08, color: AppColors.textColor),
              ),
              Text(
                "We have sent verification code to",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Row(
                children: [
                  Text(
                    "+91 ******$number",
                    style: const TextStyle(color: AppColors.textColor),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.user_login);
                    },
                    child: const Text(
                      'Change phone number?',
                      style: TextStyle(color: Colors.amber),
                    ),
                  )
                ],
              ),
              const OTPForm(),
              Center(
                child: RichText(
                    text: TextSpan(
                        style: const TextStyle(color: AppColors.textColor),
                        children: [
                      const TextSpan(text: 'Resend code after '),
                      TextSpan(
                        text:
                            '${(resendTimer ~/ 60).toString().padLeft(2, '0')}:${(resendTimer % 60).toString().padLeft(2, '0')}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ])),
              ),
              const Spacer(),
              Visibility(
                visible: resendTimer == 0,
                child: Align(
                  alignment: Alignment.center,
                  child: RoundButton(
                      text: 'Resend',
                      func: () {
                        setState(() {
                          resendTimer = 90;
                          startTimer();
                        });
                      }),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
