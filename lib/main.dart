import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:blue_hive_ecommerce/firebase_options.dart';
import 'package:blue_hive_ecommerce/models/cart.dart';
import 'package:blue_hive_ecommerce/provider/user_provider.dart';
import 'package:blue_hive_ecommerce/screens/auth_screens/authentication_screen.dart';
import 'package:blue_hive_ecommerce/screens/home/page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartModel(),
        ),
      ],
      child: MaterialApp(
        title: "Blue_Hive E-commerce",
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return Page_View();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.hasError}"),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: tPrimary,
                ),
              );
            }
            return AuthenticationScreen();
          }),
        ),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: tBackground,
            elevation: 0,
            iconTheme: IconThemeData(
              color: tBlack,
            ),
          ),
        ),
      ),
    );
  }
}
