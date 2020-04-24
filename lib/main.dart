
  
import 'package:flutter/material.dart';
import 'package:tinsearch_projecto/container/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.indigo
      ),
      home: HomePage(),
    );
  }
}