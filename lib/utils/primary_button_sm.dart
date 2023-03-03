import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:flutter/material.dart';

class PrimaryButtonSm extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const PrimaryButtonSm(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 16.0,
      ),
      child: SizedBox(
        width: 160,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: tPrimary,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
