import 'package:flutter/material.dart';
import 'package:the_ecommerce/constants.dart';
import 'package:the_ecommerce/widgets/custom_btn.dart';
import 'package:the_ecommerce/widgets/custom_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 24.0),
                child: Text(
                  "Welcome User, \nLogin to your account",
                  textAlign: TextAlign.center,
                  style: Constants.boldHeading,
                ),
              ),
              Column(
                children: [
                  CustomInput(hintText: 'Enter your email'),
                  CustomInput(hintText: 'Enter your password'),
                  CustomBtn(
                    text: "Register",
                    onPressed: () {
                      print("Clicked the register button");
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomBtn(
                  text: "Create New Account",
                  onPressed: () {
                    print("Clicked the create account button");
                  },
                  outlineBtn: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
