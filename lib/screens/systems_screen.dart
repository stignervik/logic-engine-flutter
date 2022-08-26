import 'package:flutter/material.dart';
import 'package:logic_engine_flutter/widgets/drawer.dart';
import './units_screen.dart';

class SystemsScreens extends StatelessWidget {
  const SystemsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Systems')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Units'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UnitsScreen(
                        units: const [],
                        filteredUnits: const [],
                      )),
            );
          },
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
