import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/DB/DatabaseHelper.dart';
import 'package:fyp_project_group_a/Home/bottomNavigation.dart';
import 'package:fyp_project_group_a/Page/ForgetPassword.dart';
import 'dart:core';

import 'package:fyp_project_group_a/Page/OtpScreen.dart';
import 'package:fyp_project_group_a/Page/SignupPage.dart';
import 'package:fyp_project_group_a/Util/MyDialogUtils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');

  // DatabaseHelper instance for database operations
  final DatabaseHelper databaseHelper = DatabaseHelper();

  // Track the validation status of each field
  bool isPhoneNumberValid = true;
  bool isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFF357AFF),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Image.asset(
                        'assets/images/Pattern.png',
                        width: double.infinity,
                      ),
                    ),
                    Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Image.asset(
                              'assets/images/Logo_App.png',
                              height: 150,
                              width: 150,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Container(
                            height: 700,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10, left: 20),
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
                                          fontFamily: 'Intersemibold',
                                          fontSize: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 0.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: _buildTextField(
                                    'Phone Number | User ID ',
                                    Icons.phone,
                                    phoneNumberController,
                                    isPassword: false,
                                    isValid: isPhoneNumberValid,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: _buildTextField(
                                    'Password',
                                    Icons.lock,
                                    passwordController,
                                    isPassword: true,
                                    isValid: isPasswordValid,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                  height: 56,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _loginUser();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.orange),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.white,
                                          fontFamily: "Intersemibold",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                                      );
                                    },
                                    child: Center(
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 16.0,
                                          fontFamily: "Intersemibold",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Don't have an account yet ",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16.0,
                                                fontFamily: "Inter",
                                              ),
                                            ),
                                            TextSpan(
                                              text: "? Sign Up",
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 16.0,
                                                fontFamily: "Intersemibold",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, TextEditingController controller, {bool isPassword = false, bool isValid = true}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        style: TextStyle(
          fontFamily: 'Intersemibold',
          fontSize: 14.0,
        ),
        controller: controller,
        keyboardType: isPassword ? TextInputType.text : TextInputType.text,
        obscureText: isPassword ? !isPasswordVisible : false,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: isValid ? Colors.blue : Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  void _loginUser() async {
    setState(() {
      isPhoneNumberValid = true;
      isPasswordValid = true;
    });

    if (_isInputValid()) {
      bool isValid = await databaseHelper.authenticateUser(
        phoneNumberController.text,
        passwordController.text,
      );

      if (isValid) {
        // MyDialogUtils.showGenericDialogPositive(
        //   context: context,
        //   title: 'You are Successfully logged in',
        //   onConfirmPressed: (value) {
        //     print('User entered: $value');
        //   },
        // );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBarScreen()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBarScreen()),
        );
        // setState(() {
        //   isPhoneNumberValid = false;
        //   isPasswordValid = false;
        // });
        // MyDialogUtils.showGenericDialogNegative(
        //   context: context,
        //   title: 'Invalid ID or password',
        //   onConfirmPressed: (value) {
        //     print('User entered: $value');
        //   },
        // );
      }
    }
  }

  bool _isInputValid() {
    return isPhoneNumberValid && isPasswordValid;
  }
}
