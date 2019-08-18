import 'package:flutter/material.dart';

import 'Home.dart';
import 'Homepage.dart';
import 'Registration Form/SignIn.dart';
import 'Registration Form/WelcomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: Homepage(),

      routes: <String, WidgetBuilder> {
        '/Home': (BuildContext context) => new Home(),
        '/SignIn' : (BuildContext context) => new SignIn(),

      },
    );
  }
}
