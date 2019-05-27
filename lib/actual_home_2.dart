import 'package:flutter/material.dart';

class DummyScreen1 extends StatelessWidget {
  final ScrollController scrollController;
  DummyScreen1({this.scrollController});

  @override
  Widget build(BuildContext context) {
    print("dsc===== $scrollController");
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
        controller: scrollController,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 300,
            margin: EdgeInsets.all(10),
            child: Container(
              margin: EdgeInsets.fromLTRB(12, 12, 6, 6),
              height: 100,
              color: Colors.yellow,
              child: RaisedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/one');
                },
                child: Text('sc1'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DummyScreen2 extends StatelessWidget {
  final ScrollController scrollController;
  DummyScreen2({this.scrollController});

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
        controller: scrollController,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 300,
            margin: EdgeInsets.all(10),
            child: Container(
              margin: EdgeInsets.fromLTRB(12, 12, 6, 6),
              height: 100,
              color: Colors.green,
              child: RaisedButton(
                onPressed: () {},
                child: Text('sc2'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NestedNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigationKey;
  final String initialRoute;
  final Map<String, WidgetBuilder> routes;

  NestedNavigator({
    @required this.navigationKey,
    @required this.initialRoute,
    @required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Navigator(
        key: navigationKey,
        initialRoute: initialRoute,
        onGenerateRoute: (RouteSettings routeSettings) {
          WidgetBuilder builder = routes[routeSettings.name];
          if (routeSettings.isInitialRoute) {
            return PageRouteBuilder(
              pageBuilder: (context, __, ___) => builder(context),
              settings: routeSettings,
            );
          } else {
            return MaterialPageRoute(
              builder: builder,
              settings: routeSettings,
            );
          }
        },
      ),
      onWillPop: () {
        if (navigationKey.currentState.canPop()) {
          navigationKey.currentState.pop();
          return Future<bool>.value(false);
        }
        return Future<bool>.value(true);
      },
    );
  }
}

class PageOne extends StatelessWidget {
  final ScrollController scrollController;
  PageOne({this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(315, 50),
        child: Container(
          height: 50,
          color: Colors.blue,
          alignment: Alignment.bottomLeft,
          child: RaisedButton(
            onPressed: () {
              print("hey");
              Navigator.of(context).pop();
            },
            child: Text('back'),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          controller: scrollController,
          children: <Widget>[
            Text('Page One'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/two');
              },
              child: Text('to Page Two'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('back'),
            ),
            Container(
              height: 600,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  final ScrollController scrollController;
  PageTwo({this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(315, 50),
        child: Container(
          height: 50,
          color: Colors.blue,
          alignment: Alignment.bottomLeft,
          child: Text("inner 2nd page appbar"),
        ),
      ),
      body: Center(
        child: ListView(
          controller: scrollController,
          children: <Widget>[
            Text('Page Two'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/three');
              },
              child: Text('go to next'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('go to back'),
            ),
            Container(
              height: 400,
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  final ScrollController scrollController;
  PageThree({this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Page Three'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('go to back'),
            ),
          ],
        ),
      ),
    );
  }
}
