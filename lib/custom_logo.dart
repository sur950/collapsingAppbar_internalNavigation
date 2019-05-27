import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  final double logoTopValue;
  final double logoLeftValue;
  final double logoWidthHeight;

  Logo({this.logoTopValue, this.logoLeftValue, this.logoWidthHeight});

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.logoTopValue,
      left: widget.logoLeftValue,
      child: Container(
        height: widget.logoWidthHeight,
        width: widget.logoWidthHeight,
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
