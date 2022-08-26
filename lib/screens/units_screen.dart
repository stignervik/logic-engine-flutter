import 'package:flutter/material.dart';
import 'package:logic_engine_flutter/widgets/drawer.dart';
import 'package:logic_engine_flutter/models/unit.dart';
import 'package:logic_engine_flutter/widgets/unitlisttile.dart';
import 'package:logic_engine_flutter/widgets/footer.dart';

// ignore: must_be_immutable
class UnitsScreen extends StatefulWidget {
  List<Unit> units;
  List<Unit> filteredUnits;
  UnitsScreen({Key? key, required this.units, required this.filteredUnits})
      : super(key: key) {
    units = List<Unit>.generate(
        10001,
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
    List<Unit> dummySearchList = List<Unit>.empty(growable: true);
    dummySearchList.addAll(widget.units);
    if (query.isNotEmpty) {
      final filterList =
          widget.units.where((unit) => unit.name.contains(query)).toList();
      setState(() {
        if (widget.filteredUnits.isNotEmpty) {
          widget.filteredUnits.clear();
        }
        widget.filteredUnits.addAll(filterList);
      });
    } else {
      setState(() {
        if (widget.filteredUnits.isNotEmpty) {
          widget.filteredUnits.clear();
        }
        widget.filteredUnits.addAll(widget.units);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Units')),
      body: Column(
        children: [
          const Text('Unit List'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
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
              itemCount: widget.filteredUnits.length,
              prototypeItem: const ListTile(
                title: Text('Units'),
              ),
              itemBuilder: (context, index) {
                return UnitListTile(
                  id: widget.filteredUnits[index].id,
                  name: widget.filteredUnits[index].name,
                  unitClass: widget.filteredUnits[index].unitClass,
                  unitFunction: widget.filteredUnits[index].unitFunciton,
                );
              },
            ),
          ),
          const Footer(),
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}
