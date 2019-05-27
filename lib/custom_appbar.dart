import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  dynamic onValueChange;
  @override
  State<StatefulWidget> createState() => CustomAppbarState();
}

class CustomAppbarState extends State<CustomAppbar> {
  double previousOffsetValue = 0.0;
  double tweenValue = 150.0;

  @override
  void initState() {
    widget.onValueChange = (ScrollController _scrollController) {
      print(_scrollController.offset);
      setState(() {
        if (_scrollController.offset >= previousOffsetValue &&
            _scrollController.offset <= 35 &&
            _scrollController.offset >= 0) {
          tweenValue = 150 - (_scrollController.offset * 2);
        } else if (_scrollController.offset < previousOffsetValue &&
            _scrollController.offset <= 35 &&
            _scrollController.offset >= 0) {
          tweenValue = 150 - (_scrollController.offset * 2);
        }
        previousOffsetValue = _scrollController.offset;
      });
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Container(
      width: queryData.size.width,
      height: tweenValue,
      padding: EdgeInsets.only(left: 20),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        color: Colors.black87,
        border: Border(
          bottom: BorderSide(color: Colors.red, width: 5),
        ),
      ),
      child: Text(
        "Suresh",
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}
