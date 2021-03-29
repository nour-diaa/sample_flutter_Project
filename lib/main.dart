import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import './screens/bloglist.dart';
import 'controllers/bloglistcontroller.dart';
import 'screens/login.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final box = GetStorage();
  bool get loggedIn => box.read("token") == null ? false : true;
  @override
  Widget build(BuildContext context) {
    print("tokenBox: " + box.read("token").toString());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loggedIn ? BlogList() : LoginScreen(),
    );
  }
}
