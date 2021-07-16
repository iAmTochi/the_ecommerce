import 'package:flutter/material.dart';
import 'package:the_ecommerce/constants.dart';
import 'package:the_ecommerce/widgets/custom_btn.dart';
import 'package:the_ecommerce/widgets/custom_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  CustomInput(),
                  CustomInput(),
                  CustomBtn(
                    text: "Login",
                    onPressed: () {
                      print("Clicked the login button");
                    },
                  )
                ],
              ),
              CustomBtn(
                text: "Create New Account",
                onPressed: () {
                  print("Clicked the create account button");
                },
                outlineBtn: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
