import 'package:flutter/material.dart';
import 'package:logic_engine_flutter/models/unit.dart';

class Units with ChangeNotifier {
  List<Unit> _units = [];
  List<Unit> get units {
    return [..._units];
  }

  Units() {
    // ignore: avoid_print
    print("Create Units Provider...");
    _units = List<Unit>.generate(
        10001,
        (i) => Unit(
            id: '$i',
            name: 'Unit$i',
            unitClass: 'Unit',
            unitFunciton: 'Control'));
    // ignore: avoid_print
    print('number of units: ${_units.length}');
  }
}
