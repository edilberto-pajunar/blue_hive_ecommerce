import 'package:blue_hive_ecommerce/constants/global_variable.dart';
import 'package:blue_hive_ecommerce/service/auth_service.dart';
import 'package:blue_hive_ecommerce/utils/primary_button_lg.dart';
import 'package:blue_hive_ecommerce/utils/reusable_form.dart';
import 'package:blue_hive_ecommerce/utils/snackbar.dart';
import 'package:blue_hive_ecommerce/screens/auth_screens/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => Login())));
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthService().signUpUser(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text);
    print(res);

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign Up",
                  style: tPrimaryText,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ReusableForm(
              label: "Name",
              controller: _nameController,
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
                child: GestureDetector(
                  onTap: navigateToLogin,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
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
            ),
            SizedBox(height: 28),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : PrimaryButtonLg(
                    label: "Signup",
                    onPressed: signUpUser,
                  ),
          ],
        ),
      ),
    );
  }
}
