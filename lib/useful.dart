import 'package:flutter/material.dart';
import 'package:internal_nacigation_test/custom_appbar.dart';
import 'actual_home_2.dart';
import 'custom_logo.dart';

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

  int _currentIndex;
  double previousOffsetValue;
  double tweenValue;
  double logoWidthHeight;
  double logoLeftValue;
  double logoTopValue;

  @override
  void initState() {
    super.initState();

    _currentIndex = 0;
    previousOffsetValue = 0.0;
    tweenValue = 150.0;
    logoWidthHeight = 120.0;
    logoLeftValue = 130.0;
    logoTopValue = 50.0;

    _scrollController.addListener(() {
      print(_scrollController.offset);
      if (_scrollController.offset >= previousOffsetValue &&
          _scrollController.offset <= 35 &&
          _scrollController.offset >= 0) {
        tweenValue = 150 - (_scrollController.offset * 2);
        logoWidthHeight = 120 - _scrollController.offset;
        logoLeftValue = 130 + (_scrollController.offset / 2);
        logoTopValue = 50 - _scrollController.offset / 2;
      } else if (_scrollController.offset < previousOffsetValue &&
          _scrollController.offset <= 35 &&
          _scrollController.offset >= 0) {
        tweenValue = 150 - (_scrollController.offset * 2);
        logoWidthHeight = 85 + (35 - _scrollController.offset);
        logoLeftValue = 165 - (35 - _scrollController.offset / 2);
        logoTopValue = 32.5 + (35 - _scrollController.offset) / 2;
      }

      previousOffsetValue = _scrollController.offset;
    });

    _scrollController1.addListener(() {
      print(_scrollController1.offset);
      setState(() {
        if (_scrollController1.offset >= previousOffsetValue &&
            _scrollController1.offset <= 35 &&
            _scrollController1.offset >= 0) {
          tweenValue = 150 - (_scrollController1.offset * 2);
          logoWidthHeight = 120 - _scrollController1.offset;
          logoLeftValue = 130 + (_scrollController1.offset / 2);
          logoTopValue = 50 - _scrollController1.offset / 2;
        } else if (_scrollController1.offset < previousOffsetValue &&
            _scrollController1.offset <= 35 &&
            _scrollController1.offset >= 0) {
          tweenValue = 150 - (_scrollController1.offset * 2);
          logoWidthHeight = 85 + (35 - _scrollController1.offset);
          logoLeftValue = 165 - (35 - _scrollController1.offset / 2);
          logoTopValue = 32.5 + (35 - _scrollController1.offset) / 2;
        }
      });
      previousOffsetValue = _scrollController1.offset;
    });
  }

  @override
  void dispose() {
    super.dispose();
    // _scrollController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              CustomAppbar(tweenValue: tweenValue),
              Expanded(
                child: _currentIndex == 0
                    ? NestedNavigator(
                        navigationKey: navigationKey,
                        initialRoute: '/',
                        routes: {
                          // default rout as '/' is necessary!
                          '/': (context) =>
                              OldHome(scrollController: _scrollController),
                          '/one': (context) =>
                              PageOne(scrollController: _scrollController1),
                          '/two': (context) =>
                              PageTwo(scrollController: _scrollController1),
                          '/three': (context) => PageThree(),
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
          Logo(
            logoTopValue: logoTopValue,
            logoLeftValue: logoLeftValue,
            logoWidthHeight: logoWidthHeight,
          ),
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
            title: Text("Match Day"),
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
            title: Text("Chat"),
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
            title: Text("Tickets"),
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

class OldHome extends StatefulWidget {
  final ScrollController scrollController;

  OldHome({this.scrollController});

  @override
  _OldHomeState createState() => _OldHomeState();
}

class _OldHomeState extends State<OldHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(315, 50),
        child: Container(
          height: 50,
          color: Colors.blue,
          alignment: Alignment.bottomLeft,
          child: Text("inside appbar"),
        ),
      ),
      backgroundColor: Colors.black87,
      body: ListView.builder(
        controller: widget.scrollController,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 150,
            margin: EdgeInsets.all(10),
            child: Container(
              margin: EdgeInsets.fromLTRB(12, 12, 6, 6),
              height: 90,
              color: Colors.grey,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 25,
                    margin: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        print("hi");
                      },
                      child: Text('to root'),
                    ),
                  ),
                  Container(
                    height: 25,
                    margin: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/one");
                      },
                      child: Text('Page oNe'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
