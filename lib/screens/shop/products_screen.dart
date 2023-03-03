import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:blue_hive_ecommerce/models/cart.dart';
import 'package:blue_hive_ecommerce/screens/bag/bag_screen.dart';
import 'package:blue_hive_ecommerce/screens/shop/product.dart';
import 'package:blue_hive_ecommerce/utils/primary_button_lg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: tBlack,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Women's tops",
              style: tPrimaryText,
            ),
            Expanded(
              child: Consumer<CartModel>(
                builder: ((context, value, child) {
                  return GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1 / 1.3, crossAxisCount: 2),
                    itemBuilder: ((context, index) {
                      return ProductTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index);
                        },
                      );
                    }),
                  );
                }),
              ),
            ),
            PrimaryButtonLg(
                label: "Cart",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => BagScreen())));
                }),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  final VoidCallback onPressed;
  const ProductTile({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: tPrimary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            Image.asset(
              imagePath,
              height: 64,
            ),

            // item name

            Text(itemName),

            // price + button
            MaterialButton(
              color: color,
              onPressed: onPressed,
              child: Text(
                "\$" + itemPrice,
                style: TextStyle(
                  color: tBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
