import 'package:flutter/material.dart';
import 'package:hrise/component/text_style.dart';

class TextfieldInput extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const TextfieldInput({
    super.key,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: AppTextStyles.inputField,
      decoration: InputDecoration(
          hintStyle: AppTextStyles.heading4,
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none)),
    );
  }
}
