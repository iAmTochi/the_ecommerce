import 'package:flutter/material.dart';
import 'package:the_ecommerce/constants.dart';

class BottomTabs extends StatefulWidget {
  final int? selectedTab;
  final Function(int) tabPressed;
  BottomTabs({this.selectedTab, required this.tabPressed});

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            spreadRadius: 1.0,
            blurRadius: 30.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabBtn(
            imagePath: 'assets/images/tab_home.png',
            selected: _selectedTab == 0 ? true : false,
            onPressed: () {
              // widget.selectedTab ?? 0;
              widget.tabPressed(0);
            },
          ),
          BottomTabBtn(
            imagePath: 'assets/images/tab_search.png',
            selected: _selectedTab == 1 ? true : false,
            onPressed: () {
              widget.tabPressed(1);
            },
          ),
          BottomTabBtn(
            imagePath: 'assets/images/tab_saved.png',
            selected: _selectedTab == 2 ? true : false,
            onPressed: () {
              widget.tabPressed(3);
            },
          ),
          BottomTabBtn(
            imagePath: 'assets/images/tab_logout.png',
            selected: _selectedTab == 3 ? true : false,
            onPressed: () {
              setState(() {
                _selectedTab = 3;
              });
            },
          ),
        ],
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  final String imagePath;
  final bool? selected;
  final VoidCallback? onPressed;
  // final Function(String)? onPressed;
  BottomTabBtn({required this.imagePath, this.selected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 28.0,
          horizontal: 24.0,
        ),
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(
            color:
                _selected ? Theme.of(context).accentColor : Colors.transparent,
            width: 2.0,
          ),
        )),
        child: Image(
          image: AssetImage(imagePath),
          width: 22.0,
          height: 22.0,
          color: _selected ? Theme.of(context).accentColor : Colors.black,
        ),
      ),
    );
  }
}
