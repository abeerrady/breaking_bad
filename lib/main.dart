import 'package:breaking_bad/views/sign_Up/view.dart';
import 'package:breaking_bad/views/splash/view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: SignUpView(),
    );
  }
}

