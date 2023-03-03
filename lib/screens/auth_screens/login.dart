import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:blue_hive_ecommerce/screens/home/page_view.dart';
import 'package:blue_hive_ecommerce/service/auth_service.dart';
import 'package:blue_hive_ecommerce/utils/primary_button_lg.dart';
import 'package:blue_hive_ecommerce/utils/reusable_form.dart';
import 'package:blue_hive_ecommerce/utils/snackbar.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthService().signIn(
        email: _emailController.text, password: _passwordController.text);

    if (res == "success") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Page_View()));
    } else {
      showSnackBar(res, context);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tBackground,
      appBar: AppBar(
        backgroundColor: tBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: tBlack,
          onPressed: () {},
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Login",
                style: tPrimaryText,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ReusableForm(
            label: "Email",
            controller: _emailController,
          ),
          ReusableForm(
            label: "Password",
            controller: _passwordController,
            isObscure: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Forgot your password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: tPrimary,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : PrimaryButtonLg(
                  label: "Login",
                  onPressed: loginUser,
                ),
        ],
      ),
    );
  }
}
