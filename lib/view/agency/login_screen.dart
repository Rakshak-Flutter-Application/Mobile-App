import 'package:flutter/material.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class AgencyLoginScren extends StatefulWidget {
  const AgencyLoginScren({super.key});

  @override
  State<AgencyLoginScren> createState() => _AgencyLoginScrenState();
}

class _AgencyLoginScrenState extends State<AgencyLoginScren> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              decoration: InputDecoration(
                  labelText: "Agency ID",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.width * 1))),
            ),
            SizedBox(
              height: size.height * .025,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Enter password",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.visibility),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.width * 1))),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget your password?",
                style: TextStyle(fontSize: size.width * .03, letterSpacing: 1),
              ),
            ),
            SizedBox(
              height: size.width * .2,
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, RoutesName.agency_home),
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
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, RoutesName.agency_signup),
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
