import 'package:curved_labeled_gradient_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_gradient_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home,color: Colors.white,),
            label: 'Home',
            labelStyle: TextStyle(color: Colors.white)
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.search,
              color: Colors.white,
            ),
            label: 'Search',
            labelStyle: TextStyle(color: Colors.white)
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.chat_bubble_outline,
              color: Colors.white,
            ),
            label: 'Chat',
            labelStyle: TextStyle(color: Colors.white)
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.newspaper,
              color: Colors.white,
            ),
            label: 'Feed',
            labelStyle: TextStyle(color: Colors.white)
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity,
              color: Colors.white,
            ),
            label: 'Personal',
            labelStyle: TextStyle(
              color: Colors.white
            )
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        buttonGradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xFF00E6FF), Color(0xFFAE00E9)],
          transform: GradientRotation(85.84 * math.pi / 180),
        ),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xFF00E6FF), Color(0xFFAE00E9)],
          transform: GradientRotation(85.84 * math.pi / 180),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_page.toString(), textScaler: TextScaler.linear(10.0)),
              ElevatedButton(
                child: Text('Go To Page of index 1'),
                onPressed: () {
                  final CurvedNavigationBarState? navBarState =
                      _bottomNavigationKey.currentState;
                  navBarState?.setPage(1);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
