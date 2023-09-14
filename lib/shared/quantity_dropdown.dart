import 'package:flutter/material.dart';
import '../services/daily.dart';

class QuantityDropdown extends StatelessWidget {
  const QuantityDropdown({
    super.key,
    required this.quantityCatcher,
    required this.initialQuantity,
  });
  final Quantity initialQuantity;
  final void Function(Quantity quantity) quantityCatcher;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: Quantity.none, label: "None"),
        DropdownMenuEntry(value: Quantity.little, label: "Little"),
        DropdownMenuEntry(value: Quantity.some, label: "Some"),
        DropdownMenuEntry(value: Quantity.aLot, label: "A lot"),
      ],
      initialSelection: initialQuantity,
      onSelected: (value) => quantityCatcher(value!),
    );
  }
}
