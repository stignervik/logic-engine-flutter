import 'package:flutter/material.dart';
import 'package:logic_engine_flutter/widgets/drawer.dart';
import './units_screen.dart';
import 'package:logic_engine_flutter/widgets/footer.dart';

class SystemsScreens extends StatelessWidget {
  const SystemsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Systems')),
      body: Column(children: [
        Expanded(
            child: Column(children: [
          ElevatedButton(
            child: const Text('Units'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UnitsScreen()),
              );
            },
          ),
        ])),
        const Footer(),
      ]),
      drawer: const CustomDrawer(),
    );
  }
}
