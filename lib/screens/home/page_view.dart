import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:blue_hive_ecommerce/models/user.dart' as model;
import 'package:blue_hive_ecommerce/provider/user_provider.dart';
import 'package:blue_hive_ecommerce/screens/favorite/favorite_screen.dart';
import 'package:blue_hive_ecommerce/screens/home/main_screen.dart';
import 'package:blue_hive_ecommerce/screens/profile/profile.dart';
import 'package:blue_hive_ecommerce/screens/shop/shop_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/primary_button_sm.dart';
import '../bag/bag_screen.dart';

class Page_View extends StatefulWidget {
  Page_View({super.key});

  @override
  State<Page_View> createState() => _Page_ViewState();
}

class _Page_ViewState extends State<Page_View> {
  final screens = [
    MainScreen(),
    ShopScreen(),
    BagScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
        ),
        child: NavigationBar(
          backgroundColor: tBackground,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(Icons.shop_outlined),
              label: "Shop",
              selectedIcon: Icon(Icons.shop),
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Bag",
              selectedIcon: Icon(
                Icons.shopping_bag,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              label: "Favorites",
              selectedIcon: Icon(
                Icons.favorite,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.account_box_outlined),
              label: "Profile",
              selectedIcon: Icon(
                Icons.account_box,
              ),
            ),
          ],
        ),
      ),
      body: screens[index],
    );
  }
}
