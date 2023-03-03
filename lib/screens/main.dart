import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:blue_hive_ecommerce/models/user.dart' as model;
import 'package:blue_hive_ecommerce/provider/user_provider.dart';
import 'package:blue_hive_ecommerce/screens/favorites.dart';
import 'package:blue_hive_ecommerce/screens/main_screen.dart';
import 'package:blue_hive_ecommerce/screens/profile.dart';
import 'package:blue_hive_ecommerce/screens/shop_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/primary_button_sm.dart';
import 'bag_screen.dart';

class Main extends StatefulWidget {
  Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final screens = [
    MainScreen(),
    ShopScreen(),
    BagScreen(),
    Favorites(),
    Profile(),
  ];
  int index = 1;

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
