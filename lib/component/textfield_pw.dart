import 'package:flutter/material.dart';
import 'text_style.dart';

class TextfileldPw extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;
  final Icon? suffixIcon;
  final TextEditingController? controller;

  const TextfileldPw({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.onToggleVisibility,
    this.suffixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppTextStyles.inputField,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintStyle: AppTextStyles.heading4,
        hintText: hintText,
        filled: true,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: suffixIcon!,
                onPressed: onToggleVisibility ?? () {},
              )
            : null,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
    );
  }
}
