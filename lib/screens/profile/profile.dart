import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:blue_hive_ecommerce/service/auth_service.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.search,
            color: tBlack,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Profile",
              style: tPrimaryText,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: tPrimary,
                  child: Icon(
                    Icons.account_box_rounded,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Matilda Brown",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("pajunar0@gmail.com"),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("My Orders"),
                      subtitle: Text("Already have 12 orders"),
                      trailing: Icon(
                        Icons.keyboard_arrow_right_rounded,
                      ),
                    );
                  }),
            ),
            Center(
              child: ElevatedButton(
                onPressed: AuthService().signOut,
                child: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
