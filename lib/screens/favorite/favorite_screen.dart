import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  List _favoriteList = [
    "Summer",
    "T-Shirts",
    "Shirts",
    "Shorts",
  ];

  List _favoriteTile = [
    [tNewCategoryWomen, "Lime", "Shirt", "Blue", "L", 32],
    [tNewCategoryWomen, "Lime", "Shirt", "Blue", "L", 32],
    [tNewCategoryWomen, "Lime", "Shirt", "Blue", "L", 32],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tBackground,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.search,
              color: tBlack,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            Text(
              "Favorites",
              style: tPrimaryText,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: tGray.withOpacity(0.4),
                )),
              ),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _favoriteList.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: tBlack,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  _favoriteList[index],
                                  style: TextStyle(
                                    color: tWhite,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _favoriteTile.length,
                  itemBuilder: ((context, index) {
                    return FavoriteTile();
                  })),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteTile extends StatelessWidget {
  const FavoriteTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage(
                    tNewCategoryWomen,
                  ),
                ),
              ),
              height: 100,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("LIME"),
                  Text("Shirt"),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: tGray,
                          ),
                          text: "Color: ",
                          children: [
                            TextSpan(
                                text: "Blue",
                                style: TextStyle(
                                  color: tBlack,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: tGray,
                          ),
                          text: "Size: ",
                          children: [
                            TextSpan(
                                text: "L",
                                style: TextStyle(
                                  color: tBlack,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "32\$",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
