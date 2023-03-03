import 'package:blue_hive_ecommerce/service/auth_service.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Log out"),
          onPressed: () {
            AuthService().signOut();
          },
        ),
      ),
    );
  }
}
