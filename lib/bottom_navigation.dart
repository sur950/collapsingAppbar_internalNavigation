import 'package:flutter/material.dart';
import 'package:internal_nacigation_test/custom_appbar.dart';
import 'internal_pages_nested_navigation.dart';
import 'custom_logo.dart';
import 'dummy_screens.dart';
import 'oldHome.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBar createState() => _CustomBottomNavigationBar();
}

class _CustomBottomNavigationBar extends State<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  static final GlobalKey<NavigatorState> navigationKey =
      GlobalKey<NavigatorState>();

  ScrollController _scrollController = ScrollController();
  ScrollController _scrollController1 = ScrollController();
  ScrollController _scrollController2 = ScrollController();

  CustomAppbar customAppbar;
  Logo logo;
  int _currentIndex;

  @override
  void initState() {
    super.initState();

    _currentIndex = 0;
    customAppbar = CustomAppbar();
    logo = Logo();

    _scrollController.addListener(() {
      print(_scrollController.offset);
      logo.onValueChange(_scrollController);
      customAppbar.onValueChange(_scrollController);
    });

    _scrollController1.addListener(() {
      print(_scrollController1.offset);
      logo.onValueChange(_scrollController1);
      customAppbar.onValueChange(_scrollController1);
    });

    _scrollController2.addListener(() {
      print(_scrollController2.offset);
      logo.onValueChange(_scrollController2);
      customAppbar.onValueChange(_scrollController2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              customAppbar,
              Expanded(
                child: _currentIndex == 0
                    ? NestedNavigator(
                        navigationKey: navigationKey,
                        initialRoute: '/',
                        routes: {
                          // default rout as '/' is necessary!
                          '/': (context) =>
                              OldHome(scrollController: _scrollController),
                          '/one': (context) => PageOne(
                                scrollController: _scrollController1,
                                navigationKey: navigationKey,
                              ),
                          '/two': (context) => PageTwo(
                                scrollController: _scrollController2,
                                navigationKey: navigationKey,
                              ),
                        },
                      )
                    : _currentIndex == 1
                        ? DummyScreen1(scrollController: _scrollController)
                        : _currentIndex == 2
                            ? DummyScreen2(scrollController: _scrollController)
                            : DummyScreen1(scrollController: _scrollController),
              ),
            ],
          ),
          logo,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 26,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.chat,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
            ),
            title: Text("Tab1"),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.chat,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
            ),
            title: Text("Tab2"),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.chat,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
            ),
            title: Text("Tab3"),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            title: Text("More"),
          ),
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
