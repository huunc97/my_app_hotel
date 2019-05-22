import 'package:flutter/material.dart';
import 'package:login/proflie.dart';
//import 'package:login/proflie.dart';
import 'placeholder_page.dart';
class HomePage extends StatefulWidget {
  static String tag = 'home-page';
 @override
 State<StatefulWidget> createState() {
    return _HomePage();
  }
}
class _HomePage extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
   PlaceholderWidget(),
   PlaceholderWidget(),
   ProfileWidget(),
  ];
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('My Flutter App'),
     ),
     body: _children[_currentIndex], // new
     bottomNavigationBar: BottomNavigationBar(
       onTap:onTabTapped, // new
       currentIndex: _currentIndex,
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text('Home'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.mail),
           title: new Text('Messages'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profile')
         )
       ],
     ),
   );
 }
 void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}
