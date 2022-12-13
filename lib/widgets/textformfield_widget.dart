import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final int? maxLines;
  final String? initialValue;
  final Function(String)? onChanged;

  const CustomTextFormField(
      {super.key,
      this.initialValue,
      this.keyboardType,
      this.hintText,
      this.maxLines = 1,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged!,
      initialValue: initialValue,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 156, 255, 149),
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }
}
