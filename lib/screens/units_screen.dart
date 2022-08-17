import 'package:flutter/material.dart';
import 'package:logic_engine_flutter/widgets/drawer.dart';
import './systems_screen.dart';

class UnitsScreen extends StatelessWidget {
  const UnitsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Units')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Systems'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SystemsScreens()),
            );
          },
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
