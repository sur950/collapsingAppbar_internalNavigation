import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internal_nacigation_test/bottom_navigation.dart';

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
      title: 'Test',
      debugShowCheckedModeBanner: false,
      home: CustomBottomNavigationBar(),
    );
  }
}
