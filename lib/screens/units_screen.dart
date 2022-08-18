import 'package:flutter/material.dart';
import 'package:logic_engine_flutter/widgets/drawer.dart';

class UnitsScreen extends StatefulWidget {
  List<String> items;
  UnitsScreen({Key? key, required this.items}) : super(key: key) {
    items = List<String>.generate(1000001, (i) => 'Item $i');
  }

  @override
  State<UnitsScreen> createState() => _UnitsScreenState();
}

class _UnitsScreenState extends State<UnitsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Units')),
      body: Column(children: [
        const Text('Test'),
        Expanded(
          child: ListView.builder(
            itemCount: widget.items.length,
            prototypeItem: ListTile(
              title: Text(widget.items.first),
            ),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.items[index]),
              );
            },
          ),
        ),
      ]),
      drawer: const CustomDrawer(),
    );
  }
}


/*
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<String>.generate(10000, (i) => 'Item $i'),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<String> items;

  const MyApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Long List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          prototypeItem: ListTile(
            title: Text(items.first),
          ),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}
*/
