import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/res/components/otp_form.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                style: TextStyle(fontSize: size.width * .08),
              ),
              const Text("We have sent verification code to"),
              Row(
                children: [
                  const Text("+91******0821"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.user_login);
                      },
                      child: const Text('Change phone number?'))
                ],
              ),
              OTPForm(),
              Center(
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: AppColors.textColor),
                        children: [
                      TextSpan(text: 'Resend code after '),
                      TextSpan(text: '01:30')
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
