import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/res/components/round_button.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: size.height * .1,
                width: size.width * .3,
                color: Colors.amber,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: size.height * .11),
                      padding: EdgeInsets.symmetric(
                          vertical: size.width * .03,
                          horizontal: size.width * .07),
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(size.width * .1)),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Sign In",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          SizedBox(
                            height: size.height * .07,
                          ),
                          TextFormField(
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: AppColors.generalColor,
                                filled: true,
                                hintText: "Agency ID",
                                hintStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: AppColors.iconColor,
                                ),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                          SizedBox(
                            height: size.height * .025,
                          ),
                          TextFormField(
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.generalColor,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "Enter password",
                                hintStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: AppColors.iconColor,
                                ),
                                suffixIcon: const Icon(
                                  Icons.visibility,
                                  color: AppColors.iconColor,
                                ),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                          SizedBox(height: size.height * .03),
                          Text(
                            "Forget your password?",
                            style: TextStyle(
                                fontSize: size.width * .03,
                                letterSpacing: 1,
                                color: AppColors.textColor),
                          ),
                          SizedBox(
                            height: size.width * .1,
                          ),
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, RoutesName.agency_home),
                            child: Container(
                              height: size.height * .04,
                              width: size.width * .45,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * .05),
                              decoration: BoxDecoration(
                                  color: AppColors.generalColor,
                                  borderRadius:
                                      BorderRadius.circular(size.width * .1)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: Colors.pink[900],
                                      fontSize: size.width * .045,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.pink[900],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '----- or -----',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              RoundButton(
                  text: 'Sign up',
                  func: () =>
                      Navigator.pushNamed(context, RoutesName.agency_signup))
            ]),
      ),
    );
  }
}
