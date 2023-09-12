import 'package:flutter/material.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class UserSignupScreen extends StatefulWidget {
  const UserSignupScreen({super.key});

  @override
  State<UserSignupScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<UserSignupScreen> {
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
            Text(
              "Create account",
              style: TextStyle(
                  fontSize: size.width * .07, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * .07,
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.width * 1))),
            ),
            SizedBox(
              height: size.height * .025,
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.visibility),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.width * 1))),
            ),
            SizedBox(
              height: size.width * .2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Create ",
                  style: TextStyle(fontSize: size.width * .08),
                ),
                const Icon(Icons.arrow_forward)
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, RoutesName.user_signup),
                  child: const Text('Create',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
