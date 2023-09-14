import 'package:flutter/material.dart';
import '../services/daily.dart';

class QuantityDropdown extends StatefulWidget {
  const QuantityDropdown({
    super.key,
    required this.quantityCatcher,
  });

  final void Function(Quantity quantity) quantityCatcher;

  @override
  State<QuantityDropdown> createState() => _QuantityDropdownState();
}

class _QuantityDropdownState extends State<QuantityDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: Quantity.none, label: "None"),
        DropdownMenuEntry(value: Quantity.little, label: "Little"),
        DropdownMenuEntry(value: Quantity.some, label: "Some"),
        DropdownMenuEntry(value: Quantity.aLot, label: "A lot"),
      ],
      onSelected: (value) => setState(() {
        if (value != null) widget.quantityCatcher(value);
      }),
    );
  }
}
