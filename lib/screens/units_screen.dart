import 'package:flutter/material.dart';
import 'package:logic_engine_flutter/widgets/drawer.dart';
import 'package:logic_engine_flutter/models/unit.dart';
import 'package:logic_engine_flutter/widgets/unitlisttile.dart';

// ignore: must_be_immutable
class UnitsScreen extends StatefulWidget {
  List<Unit> units;
  List<Unit> filteredUnits;
  UnitsScreen({Key? key, required this.units, required this.filteredUnits})
      : super(key: key) {
    units = List<Unit>.generate(
        11,
        (i) => Unit(
            id: '$i',
            name: 'Unit$i',
            unitClass: 'Unit',
            unitFunciton: 'Control'));
    filteredUnits = List<Unit>.empty();
  }

  @override
  State<UnitsScreen> createState() => _UnitsScreenState();
}

class _UnitsScreenState extends State<UnitsScreen> {
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    widget.filteredUnits = widget.filteredUnits.toList();
    widget.filteredUnits.addAll(widget.units);
    super.initState();
  }

  void filterSearchResults(String query) {
    // ignore: avoid_print
    print("filter serach results...");
    List<Unit> dummySearchList = List<Unit>.empty(growable: true);
    dummySearchList.addAll(widget.units);
    if (query.isNotEmpty) {
      // List<Unit> dummyListData = List<Unit>.empty();
      //List<Unit> filterList = List<Unit>.empty(growable: true);
      // ignore: avoid_print
      print("Unit name: ${widget.units.first.name}");
      // ignore: avoid_print
      print("Query: $query widget.units: ${widget.units}");
      final filterList =
          widget.units.where((unit) => unit.name.contains(query));
      // ignore: avoid_print
      print("filter list lengtU: ${filterList.length}");
      setState(() {
        // ignore: avoid_print
        print("set state...");
        // ignore: avoid_print
        print(filterList.length);
        widget.units.clear();
        widget.units.addAll(filterList);
      });
      return;
    } else {
      setState(() {
        widget.units.clear();
        widget.units.addAll(widget.filteredUnits);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Units')),
      body: Column(children: [
        const Text('Unit List'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              // ignore: avoid_print
              filterSearchResults(value);
            },
            controller: editingController,
            decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)))),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: ScrollController(),
            itemCount: widget.units.length,
            prototypeItem: const ListTile(
              title: Text('Units'),
            ),
            itemBuilder: (context, index) {
              return UnitListTile(
                id: widget.units[index].id,
                name: widget.units[index].name,
                unitClass: widget.units[index].unitClass,
                unitFunction: widget.units[index].unitFunciton,
              );
            },
          ),
        ),
      ]),
      drawer: const CustomDrawer(),
    );
  }
}
