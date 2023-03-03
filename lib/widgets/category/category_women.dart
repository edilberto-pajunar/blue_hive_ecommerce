import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:blue_hive_ecommerce/screens/shop/products_screen.dart';
import 'package:flutter/material.dart';

class CategoryWomen extends StatelessWidget {
  CategoryWomen({super.key});

  List _categoryWomenTile = [
    [
      "New",
      tNewCategoryWomen,
    ],
    [
      "Clothes",
      tNewCategoryWomen,
    ],
    [
      "Shoes",
      tNewCategoryWomen,
    ],
    [
      "Accessories",
      tNewCategoryWomen,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: tPrimary,
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Summer Sales".toUpperCase(),
                style: TextStyle(
                  color: tWhite,
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                "Up to 50% off",
                style: TextStyle(
                  color: tWhite,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: _categoryWomenTile.length,
              itemBuilder: ((context, index) {
                return CategoryWomenTile(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductsScreen(),
                  )),
                  label: _categoryWomenTile[index][0],
                  image: _categoryWomenTile[index][1],
                );
              })),
        )
      ],
    );
  }
}

class CategoryWomenTile extends StatelessWidget {
  final String label;
  final String image;
  final Function()? onTap;
  const CategoryWomenTile(
      {super.key,
      required this.label,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: tWhite,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        image,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(15),
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
