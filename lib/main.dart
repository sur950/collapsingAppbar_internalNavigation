import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internal_nacigation_test/useful.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chant',
      debugShowCheckedModeBanner: false,
      home: CustomBottomNavigationBar(),
    );
  }
}
