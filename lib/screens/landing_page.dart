import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_ecommerce/constants.dart';

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
            return Scaffold(
              body: Container(
                child: Center(
                  child: Text(
                    'Fire App Initialized!',
                    style: Constants.regularHeading,
                  ),
                ),
              ),
            );
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
