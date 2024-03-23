import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rakshak_sos/res/color.dart';
import 'package:rakshak_sos/res/components/constant.dart';
import 'package:rakshak_sos/res/components/round_button.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';

class UserSignupScreen extends StatefulWidget {
  const UserSignupScreen({super.key});

  @override
  State<UserSignupScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<UserSignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _fullName = "";
  String _phoneNumber = phoneNumber;
  String _location = "";
  String _emergencyContactName = "";
  String _emergencyContactPhoneNumber = "";
  @override
  void initState() {
    super.initState();
    locPermission();
  }

  Future<void> locPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      // ignore: unused_local_variable
      PermissionStatus status = await Permission.locationAlways.request();

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _location = position.toString();
    } else {
      // await PermissionHandler().requestPermissions([PermissionGroup.locationAlways]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          size.width * .05,
          size.width * .1,
          size.width * .05,
          size.width * .02,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: size.height * .02),
                      padding: EdgeInsets.symmetric(
                          vertical: size.width * .03,
                          horizontal: size.width * .07),
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(size.width * .1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Sign Up",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          SizedBox(height: size.height * .01),
                          TextFormField(
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                            onSaved: (value) => _fullName = value!,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null; // Return null if the input is valid.
                            },
                            decoration: InputDecoration(
                              fillColor: AppColors.generalColor,
                              filled: true,
                              hintText: "Full Name",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              prefixIcon: const Icon(
                                Icons.person,
                                color: AppColors.iconColor,
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          SizedBox(height: size.height * .005),
                          TextFormField(
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                            initialValue: _phoneNumber,
                            readOnly: true,
                            onSaved: (value) => _phoneNumber = value!,
                            decoration: InputDecoration(
                              fillColor: AppColors.generalColor,
                              filled: true,
                              hintText: "Phone Number",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: AppColors.iconColor,
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          SizedBox(height: size.height * .005),
                          // TextFormField(
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodyMedium!
                          //       .copyWith(color: Colors.black),
                          //   initialValue: _location,
                          //   onSaved: (value) => _location = value!,
                          //   decoration: InputDecoration(
                          //     fillColor: AppColors.generalColor,
                          //     filled: true,
                          //     hintText: "Location",
                          //     hintStyle: Theme.of(context).textTheme.bodyMedium,
                          //     enabledBorder: InputBorder.none,
                          //     focusedBorder: InputBorder.none,
                          //     prefixIcon: const Icon(
                          //       Icons.pin_drop,
                          //       color: AppColors.iconColor,
                          //     ),
                          //     border: const OutlineInputBorder(
                          //         borderSide: BorderSide.none),
                          //   ),
                          // ),
                          SizedBox(height: size.height * .01),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Emergency Contacts",
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: size.height * .01),
                          TextFormField(
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                            onSaved: (value) => _emergencyContactName = value!,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null; // Return null if the input is valid.
                            },
                            decoration: InputDecoration(
                              fillColor: AppColors.generalColor,
                              filled: true,
                              hintText: "Full Name",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              prefixIcon: const Icon(
                                Icons.person,
                                color: AppColors.iconColor,
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          SizedBox(height: size.height * .005),
                          TextFormField(
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                            onSaved: (value) =>
                                _emergencyContactPhoneNumber = value!,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a phone number';
                              } else if (value.length != 10) {
                                return 'Please enter a 10 digit phone number';
                              }
                              return null; // Return null if the input is valid
                            },
                            decoration: InputDecoration(
                              fillColor: AppColors.generalColor,
                              filled: true,
                              hintText: "Phone Number",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              prefixIcon: const Icon(
                                Icons.call,
                                color: AppColors.iconColor,
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          SizedBox(height: size.height * .01),
                          RoundButton(
                            func: _submitForm,
                            text: 'Sign up',
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
                      Navigator.pushNamed(context, RoutesName.user_login)),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save form data

      // You can now use the collected data for your intended purposes.
      // For example, save it to a database, send it to an API, etc.

      // Debug print for demonstration:
      print('Full Name: $_fullName');
      print('Phone Number: $_phoneNumber');
      print('Location: $_location');
      print('Emergency Contact Name: $_emergencyContactName');
      print('Emergency Contact Phone Number: $_emergencyContactPhoneNumber');

      // After processing, you can navigate to the next screen or take any other actions.
      await Navigator.pushNamed(context, RoutesName.user_dashboard);
    }
  }
}
