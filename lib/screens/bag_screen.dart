import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:blue_hive_ecommerce/utils/primary_button_lg.dart';
import 'package:flutter/material.dart';

class BagScreen extends StatelessWidget {
  BagScreen({super.key});

  List _myBagList = [
    [tNewCategoryWomen, "PullOver", 1, 51],
    [tNewCategoryWomen, "PullOver", 1, 51],
    [tNewCategoryWomen, "PullOver", 1, 51],
    [tNewCategoryWomen, "PullOver", 1, 51],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tBackground,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
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
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "My Bag",
                style: tPrimaryText,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _myBagList.length,
                  itemBuilder: (context, index) {
                    return MyBagTile(
                      image: _myBagList[index][0],
                      name: _myBagList[index][1],
                      quantity: _myBagList[index][2],
                      cost: _myBagList[index][3],
                    );
                  }),
            ),
            SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total amount:",
                        style: TextStyle(
                          color: tGray,
                        ),
                      ),
                      Text(
                        "124\$",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  PrimaryButtonLg(label: "Check Out", onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBagTile extends StatelessWidget {
  final String image;
  final String name;
  final int quantity;
  final int cost;
  const MyBagTile({
    Key? key,
    required this.image,
    required this.name,
    required this.quantity,
    required this.cost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        image,
                      ),
                    )),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
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
                              text: "Black",
                              style: TextStyle(
                                color: tBlack,
                              )),
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: tGray,
                        child: Center(
                          child: Icon(Icons.arrow_drop_down_sharp),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("$quantity"),
                      ),
                      CircleAvatar(
                        backgroundColor: tGray,
                        child: Center(
                          child: Icon(
                            Icons.arrow_drop_up_sharp,
                          ),
                        ),
                      ),
                      Align(
                        child: Text(
                          "\$$cost",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
