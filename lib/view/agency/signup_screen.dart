import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/res/components/round_button.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class AgencySignupScren extends StatefulWidget {
  const AgencySignupScren({super.key});

  @override
  State<AgencySignupScren> createState() => _AgencySignupScrenState();
}

class _AgencySignupScrenState extends State<AgencySignupScren> {
  bool formSecondPage = false;
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
                      margin: EdgeInsets.symmetric(vertical: size.height * .05),
                      padding: EdgeInsets.symmetric(
                          vertical: size.width * .03,
                          horizontal: size.width * .07),
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(size.width * .1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: Text(
                              "Sign up",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          Visibility(
                            visible: !formSecondPage,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextFormField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.black),
                                  decoration: InputDecoration(
                                      fillColor: AppColors.generalColor,
                                      filled: true,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: 'Agency ID',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(
                                              size.width * .03))),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.black),
                                  decoration: InputDecoration(
                                      hintText: 'Agency Full Name',
                                      fillColor: AppColors.generalColor,
                                      filled: true,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              size.width * .1))),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.black),
                                  decoration: InputDecoration(
                                      hintText: 'Area of Expertise',
                                      fillColor: AppColors.generalColor,
                                      filled: true,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              size.width * .1))),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.black),
                                  decoration: InputDecoration(
                                      fillColor: AppColors.generalColor,
                                      filled: true,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: 'Description',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              size.width * .1))),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.black),
                                  decoration: InputDecoration(
                                      hintText: 'Location',
                                      fillColor: AppColors.generalColor,
                                      filled: true,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              size.width * .1))),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: formSecondPage,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextFormField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.black),
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      fillColor: AppColors.generalColor,
                                      filled: true,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              size.width * .1))),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.black),
                                  decoration: InputDecoration(
                                      hintText: 'Contact number',
                                      fillColor: AppColors.generalColor,
                                      filled: true,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              size.width * .1))),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.black),
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      fillColor: AppColors.generalColor,
                                      filled: true,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              size.width * .1))),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Visibility(
                                visible: formSecondPage,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      formSecondPage = !formSecondPage;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.generalColor,
                                  ),
                                ),
                              ),
                              Text(
                                !formSecondPage ? "1/2" : "2/2",
                                style:
                                    const TextStyle(color: AppColors.textColor),
                              ),
                              Visibility(
                                visible: !formSecondPage,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      formSecondPage = !formSecondPage;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.generalColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: formSecondPage,
                            child: InkWell(
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
                  text: 'Sign in',
                  func: () =>
                      Navigator.pushNamed(context, RoutesName.agency_login))
            ]),
      ),
    );
    // location
    // Agency ID
    // Name
    // Expertise
    // Description
    // emial
    // phone no
    // final size = MediaQuery.of(context).size;
    // return Scaffold(
    //   body: Padding(
    //     padding: EdgeInsets.all(size.width * .1),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text(
    //           "Registration",
    //           style: TextStyle(fontSize: size.width * .1),
    //         ),

    //         RoundButton(
    //             func: () =>
    //                 Navigator.pushNamed(context, RoutesName.agency_home),
    //             text: 'Save')
    //       ],
    //     ),
    //   ),
    // );
  }
}
