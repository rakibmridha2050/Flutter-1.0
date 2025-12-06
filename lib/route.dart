import 'package:app_flutter/about_page.dart';
import 'package:app_flutter/home.dart';

import 'package:app_flutter/profile_page.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(MyRoutingApp());
}


class MyRoutingApp extends StatelessWidget {
  const MyRoutingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Routing Demo",

      // Named routes

      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/profile': (context) => ProfilePage(),
      },

    );
  }
}