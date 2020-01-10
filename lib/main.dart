import 'package:flutter/material.dart';
import './pages/home.dart';

/// Start the app
///  pass [StatelessWidget] [MyApp] as input parameter
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
      home: HomePage(title: 'Atlas'),
    );
  }
}

