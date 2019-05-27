import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  final double tweenValue;

  CustomAppbar({this.tweenValue});
  @override
  State<StatefulWidget> createState() => _CustomAppbar();
}

class _CustomAppbar extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Container(
      width: queryData.size.width,
      height: widget.tweenValue,
      padding: EdgeInsets.only(left: 20),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        color: Colors.black87,
        border: Border(
          bottom: BorderSide(color: Colors.red, width: 5),
        ),
      ),
      child: Text(
        "Chant",
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}
