import 'package:flutter/material.dart';

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
  final navigationKey;
  PageOne({this.scrollController, this.navigationKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(315, 50),
        child: Container(
          height: 50,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        while (navigationKey.currentState.canPop()) {
                          navigationKey.currentState.pop();
                        }
                      },
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          controller: scrollController,
          itemCount: 10,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 200,
              margin: EdgeInsets.only(bottom: 30),
              color: Colors.red,
              child: Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/two');
                  },
                  child: Text('to Page Two'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  final ScrollController scrollController;
  final navigationKey;
  PageTwo({this.scrollController, this.navigationKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(315, 50),
        child: Container(
          height: 50,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        while (navigationKey.currentState.canPop()) {
                          navigationKey.currentState.pop();
                        }
                      },
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          controller: scrollController,
          itemCount: 10,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 200,
              margin: EdgeInsets.only(bottom: 30),
              color: Colors.red,
              child: Center(
                child: RaisedButton(
                  onPressed: () {
                    // Navigator.of(context).pop();
                  },
                  child: Text('Hurrey!!!'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
