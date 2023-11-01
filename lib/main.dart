import 'package:flutter/material.dart';
import 'package:keretaapi/login_page.dart';

void main() => runApp(const MyApp());
var ip = "http://202.51.121.181:3030/service/";

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Factory Shoppers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: login_page_(),
    );
  }
}
