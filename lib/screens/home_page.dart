import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_ecommerce/constants.dart';
import 'package:the_ecommerce/widgets/bottom_tabs.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              children: [
                Container(
                  child: Center(
                    child: Text('Home Page'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('Search Page'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('Saved Page'),
                  ),
                ),
              ],
            ),
          ),
          BottomTabs(),
        ],
      ),
    );
  }
}
