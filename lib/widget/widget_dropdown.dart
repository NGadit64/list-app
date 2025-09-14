import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String labelText;
  final Function(String?)? onChanged;

  const MyDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.labelText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      items: items
          .map((c) => DropdownMenuItem(
                value: c,
                child: Text(c),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
