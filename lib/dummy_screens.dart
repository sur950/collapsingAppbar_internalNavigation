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
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {},
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
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {},
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
