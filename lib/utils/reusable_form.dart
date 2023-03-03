import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:flutter/material.dart';

class ReusableForm extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isObscure;
  const ReusableForm(
      {super.key,
      required this.label,
      required this.controller,
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: TextFormField(
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: Icon(
            color: tSuccess,
            Icons.check,
          ),
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
