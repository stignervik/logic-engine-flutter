class Unit {
  final String id;
  final String name;
  final String unitClass;
  final String unitFunciton;
  bool selected;

  Unit({
    required this.id,
    required this.name,
    required this.unitClass,
    required this.unitFunciton,
    this.selected = false,
  });
}
