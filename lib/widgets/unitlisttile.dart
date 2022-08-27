import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/units.dart';

class UnitListTile extends StatefulWidget {
  final String id;
  final String name;
  final String unitClass;
  final String unitFunction;
  bool selected;
  UnitListTile({
    super.key,
    required this.id,
    required this.name,
    required this.unitClass,
    required this.unitFunction,
    this.selected = false,
  });

  @override
  State<UnitListTile> createState() => _UnitListTileState();
}

class _UnitListTileState extends State<UnitListTile> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final unitsData = Provider.of<Units>(context);
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(2),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.purple,
          child: Text('U'),
        ),
        title: Text(widget.name),
        subtitle: Text(
            'id: ${widget.id} class: ${widget.unitClass} func: ${widget.unitFunction}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: unitsData.isUnitSelected(widget.id),
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                  unitsData.selectUnit(isChecked, widget.id);
                  widget.selected = isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
