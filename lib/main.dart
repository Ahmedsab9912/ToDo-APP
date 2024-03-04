import 'package:flutter/material.dart';

import 'HomePage/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(
          color: Colors.red,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 22),
        )
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
