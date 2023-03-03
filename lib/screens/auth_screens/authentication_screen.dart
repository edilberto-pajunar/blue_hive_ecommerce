import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:blue_hive_ecommerce/provider/user_provider.dart';
import 'package:blue_hive_ecommerce/screens/auth_screens/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  String username = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
    addData();
  }

  void getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
    });
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(tSplashLogo),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login())),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: tBackground,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimary,
                      padding: EdgeInsets.symmetric(horizontal: 45),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Signup())),
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        color: tBlack,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tBackground,
                      padding: EdgeInsets.symmetric(horizontal: 45),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
