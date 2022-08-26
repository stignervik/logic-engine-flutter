import 'package:flutter/material.dart';

class UnitListTile extends StatefulWidget {
  final String id;
  final String name;
  final String unitClass;
  final String unitFunction;
  const UnitListTile(
      {super.key,
      required this.id,
      required this.name,
      required this.unitClass,
      required this.unitFunction});

  @override
  State<UnitListTile> createState() => _UnitListTileState();
}

class _UnitListTileState extends State<UnitListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.name),
      subtitle: Text(
          'id: ${widget.id} class: ${widget.unitClass} func: ${widget.unitFunction}'),
    );
  }
}
