import 'package:flutter/material.dart';
import 'package:logic_engine_flutter/screens/main_screen.dart';
import './screens/main_screen.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Logic Engine App',
    home: LogicEngineApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class LogicEngineApp extends StatelessWidget {
  const LogicEngineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScreen();
  }
}
