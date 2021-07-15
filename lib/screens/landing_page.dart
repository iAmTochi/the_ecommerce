import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_ecommerce/constants.dart';
import 'package:the_ecommerce/screens/home_page.dart';
import 'package:the_ecommerce/screens/login_page.dart';

class LandingPage extends StatelessWidget {
  //const LandingPage({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          //if snapshot has error
          if (snapshot.hasError) {
            return Scaffold(
              body: Container(
                child: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              ),
            );
          }

          //Connection made to firebase
          if (snapshot.connectionState == ConnectionState.done) {
            //StreamBuilder can check the login state live
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, streamSnapshot) {
                  //if snapshot has error
                  if (snapshot.hasError) {
                    return Scaffold(
                      body: Container(
                        child: Center(
                          child: Text('Error: ${streamSnapshot.error}'),
                        ),
                      ),
                    );
                  }

                  //Connection state active - Do the user login check inside the
                  // if statement
                  if (streamSnapshot.connectionState ==
                      ConnectionState.active) {
                    // Get the user
                    //User _user = streamSnapshot.data;
                    var _user = streamSnapshot.data;

                    // if the user is null, we're not logged in
                    if (_user == null) {
                      //user not logged in, head to login
                      return LoginPage();
                    } else {
                      //The user is logged in, head to homepage
                      return Homepage();
                    }
                  }

                  //checking the auth state -- loading
                  return Scaffold(
                    body: Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          semanticsLabel: 'Linear progress indicator',
                        ),
                      ),
                    ),
                  );
                });
          }

          //connect to firebase - loading
          return Scaffold(
            body: Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }
}
