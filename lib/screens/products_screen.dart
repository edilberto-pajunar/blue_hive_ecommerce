import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:blue_hive_ecommerce/screens/product.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tBackground,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
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
      body: Column(
        children: [
          Text("Women's tops"),
          Expanded(
            child: GridView.builder(
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Product())),
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    tNewCategoryWomen,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Text("Mango"),
                          Text("T-Shirt SPANISH"),
                          Text("9\$"),
                        ],
                      ),
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }
}
