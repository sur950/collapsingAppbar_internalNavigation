import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  dynamic onValueChange;
  @override
  LogoState createState() => LogoState();
}

class LogoState extends State<Logo> {
  double previousOffsetValue = 0.0;
  double logoWidthHeight = 120.0;
  double logoLeftValue = 130.0;
  double logoTopValue = 50.0;
  @override
  void initState() {
    widget.onValueChange = (ScrollController _scrollController) {
      print(_scrollController.offset);
      setState(() {
        if (_scrollController.offset >= previousOffsetValue &&
            _scrollController.offset <= 35 &&
            _scrollController.offset >= 0) {
          logoWidthHeight = 120 - _scrollController.offset;
          logoLeftValue = 130 + (_scrollController.offset / 2);
          logoTopValue = 50 - _scrollController.offset / 2;
        } else if (_scrollController.offset < previousOffsetValue &&
            _scrollController.offset <= 35 &&
            _scrollController.offset >= 0) {
          logoWidthHeight = 85 + (35 - _scrollController.offset);
          logoLeftValue = 165 - (35 - _scrollController.offset / 2);
          logoTopValue = 32.5 + (35 - _scrollController.offset) / 2;
        }
        previousOffsetValue = _scrollController.offset;
      });
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: logoTopValue,
      left: logoLeftValue,
      child: Container(
        height: logoWidthHeight,
        width: logoWidthHeight,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3.0, color: Color(0xFFB9AA67)),
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/appbarLogo.jpg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
