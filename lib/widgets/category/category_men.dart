import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:flutter/material.dart';

class CategoryMen extends StatelessWidget {
  CategoryMen({super.key});

  List _CategoryMenTile = [
    [
      "New",
      tNewCategoryMen,
    ],
    [
      "Clothes",
      tNewCategoryMen,
    ],
    [
      "Shoes",
      tNewCategoryMen,
    ],
    [
      "Accessories",
      tNewCategoryMen,
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
              itemCount: _CategoryMenTile.length,
              itemBuilder: ((context, index) {
                return CategoryMenTile(
                  label: _CategoryMenTile[index][0],
                  image: _CategoryMenTile[index][1],
                );
              })),
        )
      ],
    );
  }
}

class CategoryMenTile extends StatelessWidget {
  final String label;
  final String image;
  const CategoryMenTile({super.key, required this.label, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
    );
  }
}
