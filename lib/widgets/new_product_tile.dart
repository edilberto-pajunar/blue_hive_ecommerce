import 'package:flutter/material.dart';

import '../constants/global_variable.dart';

class NewProductTile extends StatelessWidget {
  final Function()? onTap;
  const NewProductTile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(tNewProduct),
            ),
            color: Colors.grey,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "New".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: tBlack,
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
