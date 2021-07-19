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
  late PageController _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _tabsPageController,
              onPageChanged: (num) {
                setState(() {
                  _selectedTab = num;
                });
              },
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
          BottomTabs(
            selectedTab: _selectedTab,
            tabPressed: (num) {
              _tabsPageController.animateToPage(
                num,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
              );
            },
          ),
        ],
      ),
    );
  }
}
