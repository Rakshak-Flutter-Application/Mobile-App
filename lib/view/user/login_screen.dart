import 'package:flutter/material.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/res/components/constant.dart';
import 'package:rakshak_sos/res/components/round_button.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';
import 'package:rakshak_sos/view/user/dashboard.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  @override
  State<UserLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<UserLoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(size.width * .1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.asset(
            "assets/logo.png",
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: size.height * .15),
                  padding: EdgeInsets.symmetric(
                      vertical: size.width * .03, horizontal: size.width * .07),
                  decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(size.width * .1)),
                  child: Form(
                    key: _formKey,
                    child: Column(
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
                          controller: _phoneNumberController,
                          style: Theme.of(context).textTheme.bodyMedium,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              fillColor: AppColors.generalColor,
                              filled: true,
                              hintText: "Enter phone number",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              prefix: Text(
                                "+91 ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.black),
                              ),
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: AppColors.iconColor,
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a phone number';
                            } else if (value.length != 10) {
                              return 'Please enter a 10 digit phone number';
                            }
                            return null; // Return null if the input is valid
                          },
                          onSaved: (value) {
                            _phoneNumber = value;
                          },
                        ),
                        SizedBox(
                          height: size.width * .15,
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              print('Phone Number: $_phoneNumber');
                              phoneNumber = _phoneNumber!;
                              Navigator.pushNamed(context, RoutesName.otp,
                                  arguments: _phoneNumber);
                            }
                          },
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              func: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print('Phone Number: $_phoneNumber');
                  phoneNumber = _phoneNumber!;
                  Navigator.pushNamed(context, RoutesName.otp,
                      arguments: _phoneNumber);
                }
              })
        ]),
      ),
    );
  }
}
