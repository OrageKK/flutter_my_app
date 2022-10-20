import 'package:flutter/material.dart';
import 'package:my_app/pages/myHomePage.dart';
import './routes/route.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 去掉debug图标
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: const Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70),
      home: const MyHomePage(),
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}