import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    );
  }
}

// https://youtu.be/TclK5gNM_PM?si=lEi9-BUdNG9NBVna&t=4916