import 'package:flutter/material.dart';

import '../constants/global_variable.dart';

class SelectSizeTile extends StatelessWidget {
  final String size;
  const SelectSizeTile({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
          border: Border.all(
            color: tGray,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "XS",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
