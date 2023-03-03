import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:blue_hive_ecommerce/widgets/category/category_kids.dart';
import 'package:blue_hive_ecommerce/widgets/category/category_men.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/category/category_women.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);

    @override
    void dispose() {
      super.dispose();
      controller.dispose();
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: tGray.withOpacity(0.3),
        appBar: AppBar(
          backgroundColor: tBackground,
          leading: const Icon(
            Icons.arrow_back,
            color: tBlack,
          ),
          title: const Text(
            "Categories",
            style: TextStyle(
              color: tBlack,
            ),
          ),
          centerTitle: true,
          actions: const [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.search,
                color: tBlack,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Women",
                  style: TextStyle(color: tBlack),
                ),
              ),
              Tab(
                child: Text(
                  "Men",
                  style: TextStyle(color: tBlack),
                ),
              ),
              Tab(
                child: Text(
                  "Kids",
                  style: TextStyle(color: tBlack),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              CategoryWomen(),
              CategoryMen(),
              CategoryKid(),
            ],
          ),
        ),
      ),
    );
  }
}
