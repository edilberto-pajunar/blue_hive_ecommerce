import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:blue_hive_ecommerce/screens/bag/bag_screen.dart';
import 'package:blue_hive_ecommerce/utils/primary_button_lg.dart';
import 'package:blue_hive_ecommerce/utils/primary_button_sm.dart';
import 'package:blue_hive_ecommerce/utils/select_size_tile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  Product({
    super.key,
  });

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  String? size;
  String? color;
  List _product = [
    tNewProduct,
    tNewProduct,
  ];

  final itemsSize = [
    "12",
    "14",
    "16",
  ];

  final itemColor = [
    "Black",
    "White",
  ];

  final selectSize = [
    "XS",
    "S",
    "M",
    "L",
    "XL",
  ];

  Future addToCart(context) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Select Size",
                style: tHeaderText,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: GridView.builder(
                      padding: EdgeInsets.all(25),
                      itemCount: selectSize.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2, crossAxisCount: 3),
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: tGray),
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                selectSize[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
                ),
              ),
              PrimaryButtonLg(
                label: "Add to Cart",
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BagScreen()));
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tBackground,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: tBlack,
        ),
        title: Text(
          "Polo Shirt",
          style: TextStyle(
            color: tBlack,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.share,
              color: tBlack,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: _product.length,
              itemBuilder: ((context, index, realIndex) {
                final productImage = _product[index];

                return buildImage(productImage, index);
              }),
              options: CarouselOptions(
                padEnds: false,
                height: 400,
                enableInfiniteScroll: false,
                viewportFraction: 0.9,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: DropdownButtonHideUnderline(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.red,
                                  )),
                              child: DropdownButton(
                                  hint: Text("Size"),
                                  isExpanded: true,
                                  value: size,
                                  items: itemsSize.map(buildMenuItem).toList(),
                                  onChanged: (value) => setState(() {
                                        this.size = value;
                                      })),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: tGray,
                              ),
                            ),
                            child: DropdownButton(
                                hint: Text("Color"),
                                isExpanded: true,
                                value: color,
                                items: itemColor.map(buildMenuItem).toList(),
                                onChanged: (value) => setState(() {
                                      this.color = value;
                                    })),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: tGray.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border_outlined,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "H&M",
                        style: tHeaderText,
                      ),
                      Text("\$19.99", style: tHeaderText),
                    ],
                  ),
                  Text(
                    "Short black dress",
                    style: TextStyle(
                      color: tGray,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate veli"),
                  SizedBox(
                    height: 10,
                  ),
                  PrimaryButtonLg(
                      label: "Add to Cart",
                      onPressed: () {
                        addToCart(context);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildImage(String productImage, int index) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: 12.0,
    ),
    color: Colors.grey,
    child: Image.asset(
      productImage,
      fit: BoxFit.contain,
    ),
  );
}

DropdownMenuItem buildMenuItem(String item) {
  return DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    ),
  );
}
