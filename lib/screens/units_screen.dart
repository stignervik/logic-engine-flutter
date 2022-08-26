import 'package:flutter/material.dart';
import 'package:logic_engine_flutter/widgets/drawer.dart';
import 'package:logic_engine_flutter/models/unit.dart';
import 'package:logic_engine_flutter/widgets/unitlisttile.dart';
import 'package:logic_engine_flutter/widgets/footer.dart';
import 'package:provider/provider.dart';
import 'package:logic_engine_flutter/providers/units.dart';

// ignore: must_be_immutable
class UnitsScreen extends StatefulWidget {
  List<Unit> units;
  List<Unit> filteredUnits;
  UnitsScreen({Key? key, required this.units, required this.filteredUnits})
      : super(key: key) {
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
    super.initState();
  }

  void filterSearchResults(String query, Units units) {
    List<Unit> dummySearchList = List<Unit>.empty(growable: true);
    dummySearchList.addAll(units.units);
    if (query.isNotEmpty) {
      final filterList =
          units.units.where((unit) => unit.name.contains(query)).toList();
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
        widget.filteredUnits.addAll(units.units);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final unitsData = Provider.of<Units>(context);
    filterSearchResults("", unitsData);

    // ignore: avoid_print
    print('units length: ${unitsData.units.length}');
    // final units = unitsData.units;
    return Scaffold(
      appBar: AppBar(title: const Text('Units')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value, unitsData);
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
              child: SafeArea(
            child: ListView.builder(
              controller: ScrollController(),
              itemCount: widget.filteredUnits.length,
              itemBuilder: (context, index) {
                return UnitListTile(
                  id: widget.filteredUnits[index].id,
                  name: widget.filteredUnits[index].name,
                  unitClass: widget.filteredUnits[index].unitClass,
                  unitFunction: widget.filteredUnits[index].unitFunciton,
                );
              },
            ),
          )),
          const Footer(),
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}
