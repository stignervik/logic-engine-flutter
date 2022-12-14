import 'package:flutter/material.dart';
import 'package:logic_engine_flutter/screens/main_screen.dart';
import 'package:logic_engine_flutter/screens/systems_screen.dart';
import 'package:logic_engine_flutter/screens/units_screen.dart';
import 'package:logic_engine_flutter/screens/test_screen.dart';
import 'package:provider/provider.dart';
import './screens/main_screen.dart';
import 'package:logic_engine_flutter/providers/units.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Units())],
    child: MaterialApp(
      title: 'Logic Engine App',
      // home: const LogicEngineApp(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // routes: {},
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
              builder: (context) => const MainScreen(), settings: settings);
        }

        if (settings.name == '/systems') {
          return MaterialPageRoute(
              builder: (context) => const SystemsScreens(), settings: settings);
        }

        if (settings.name == '/units') {
          return MaterialPageRoute(
              builder: (context) => const UnitsScreen(), settings: settings);
        }

        if (settings.name == '/test') {
          return MaterialPageRoute(
              builder: (context) => const Test(), settings: settings);
        }

        return MaterialPageRoute(builder: (context) => const UnknownScreen());
      },
    ),
  ));
}

class LogicEngineApp extends StatelessWidget {
  const LogicEngineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => Units(), child: const UnitsScreen());
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('404!'),
      ),
    );
  }
}
