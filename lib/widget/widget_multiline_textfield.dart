import 'package:flutter/material.dart';

class MyMultilineTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final Color labelColor;

  const MyMultilineTextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    this.labelColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      maxLines: null, // banyak baris
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline, // enter = baris 
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: labelColor),
        border: const OutlineInputBorder(),
      ),
    );
  }
}

