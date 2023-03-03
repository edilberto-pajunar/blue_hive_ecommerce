import 'package:blue_hive_ecommerce/screens/product.dart';
import 'package:blue_hive_ecommerce/widgets/new_product_tile.dart';
import 'package:flutter/material.dart';

import '../constants/global_variable.dart';
import '../utils/primary_button_sm.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List _newProduct = [
    tNewProduct,
    tNewProduct,
    tNewProduct,
    tNewProduct,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  tMainImage,
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fashion Sale",
                          style: TextStyle(
                            fontSize: 48,
                            color: tWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PrimaryButtonSm(
                          label: "Check",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),

            // new products
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "New",
                        style: tPrimaryText,
                      ),
                      Spacer(),
                      Text(
                        "View all",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "You've never seen it before!",
                    style: TextStyle(
                      color: tGray,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 19,
            ),

            Container(
              height: 200,
              child: ListView.builder(
                itemCount: _newProduct.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return NewProductTile(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Product())),
                  );
                }),
              ),
            ),

            // Main 2
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
