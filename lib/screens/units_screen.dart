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
  TextEditingController _editingController = TextEditingController();

  List<Unit> filteredUnits = List<Unit>.empty();
  String _query = "";

  @override
  void initState() {
    filteredUnits = filteredUnits.toList();
    super.initState();
  }

  void filterSearchResults(Units units) {
    // ignore: avoid_print
    print(_query);
    if (_query.isNotEmpty) {
      final filterList =
          units.units.where((unit) => unit.name.contains(_query)).toList();
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

  void _clearSearch() {
    _editingController.clear();
    // Call setState to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final unitsData = Provider.of<Units>(context);
    // ignore: avoid_print
    print('unit screen state build...');

    // initialize the filterList with the units model which store all units
    if (_query.isEmpty) {
      filteredUnits.addAll(unitsData.units);
    }

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
                _query = value;
                filterSearchResults(unitsData);
              },
              controller: _editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _editingController.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: _clearSearch,
                          icon: const Icon(Icons.clear)),
                  border: const OutlineInputBorder(
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
