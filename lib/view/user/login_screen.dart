import 'package:flutter/material.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  @override
  State<UserLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<UserLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(size.width * .1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * .15,
            ),
            Center(
              child: Text(
                "Hello",
                style: TextStyle(fontSize: size.width * .25),
              ),
            ),
            Text(
              "Sign in to your account",
              style: TextStyle(fontSize: size.width * .055),
            ),
            SizedBox(
              height: size.height * .07,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  isCollapsed: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: size.width * .05),
                    child: Row(
                      children: [
                        const Icon(Icons.phone),
                        Text(
                          " +91 ",
                          style: TextStyle(fontSize: size.width * .045),
                        )
                      ],
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.width * .05))),
            ),
            SizedBox(
              height: size.width * .2,
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, RoutesName.otp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Sign in ",
                    style: TextStyle(fontSize: size.width * .08),
                  ),
                  const Icon(Icons.arrow_forward)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
