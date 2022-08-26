import 'package:flutter/material.dart';
import 'package:logic_engine_flutter/widgets/drawer.dart';
import 'package:logic_engine_flutter/models/unit.dart';
import 'package:logic_engine_flutter/widgets/unitlisttile.dart';
import 'package:logic_engine_flutter/widgets/footer.dart';
import 'package:provider/provider.dart';
import 'package:logic_engine_flutter/providers/units.dart';

// ignore: must_be_immutable
class UnitsScreen extends StatefulWidget {
  const UnitsScreen({Key? key}) : super(key: key);

  @override
  State<UnitsScreen> createState() => _UnitsScreenState();
}

class _UnitsScreenState extends State<UnitsScreen> {
  TextEditingController editingController = TextEditingController();

  List<Unit> filteredUnits = List<Unit>.empty();

  @override
  void initState() {
    filteredUnits = filteredUnits.toList();
    super.initState();
  }

  void filterSearchResults(String query, Units units) {
    // ignore: avoid_print
    print(query);
    if (query.isNotEmpty) {
      final filterList =
          units.units.where((unit) => unit.name.contains(query)).toList();
      // ignore: avoid_print
      print(filterList.length);
      setState(() {
        if (filteredUnits.isNotEmpty) {
          filteredUnits.clear();
        }
        filteredUnits.addAll(filterList);
        // ignore: avoid_print
        print('Filtered units: ${filteredUnits.length}');
      });
    } else {
      setState(() {
        if (filteredUnits.isNotEmpty) {
          filteredUnits.clear();
        }
        filteredUnits.addAll(units.units);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final unitsData = Provider.of<Units>(context);
    // ignore: avoid_print
    print('unit screen state build...');
    // filterSearchResults("", unitsData);

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
              itemCount: filteredUnits.length,
              itemBuilder: (context, index) {
                return UnitListTile(
                  id: filteredUnits[index].id,
                  name: filteredUnits[index].name,
                  unitClass: filteredUnits[index].unitClass,
                  unitFunction: filteredUnits[index].unitFunciton,
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
