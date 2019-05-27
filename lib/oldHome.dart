import 'package:flutter/material.dart';

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
          padding: EdgeInsets.only(left: 20, right: 20),
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
              child: Center(
                child: Container(
                  height: 25,
                  margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/one");
                    },
                    child: Text('Page One'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
