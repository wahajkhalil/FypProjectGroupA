import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Page/ForgetPassword.dart';
import 'package:fyp_project_group_a/Page/MoneyTracker.dart';
import 'dart:core';

import 'package:fyp_project_group_a/Page/OtpScreen.dart'; // Add this line to import the core library for the RegExp class

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');

  // Track the validation status of each field
  bool isPhoneNumberValid = true;
  bool isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Color(0xFF357AFF),
          child: ListView(
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
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 20),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontFamily:
                                            'Intersemibold', // This should match the family name specified in pubspec.yaml

                                        fontSize: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 0.0),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: _buildTextField(
                                  'Phone Number | User ID ',
                                  Icons.phone,
                                  phoneNumberController,
                                  isPassword: false,
                                  isValid: isPhoneNumberValid,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
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
                                    // Navigate to OtpScreen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OtpScreen()),
                                    );
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
                                          fontFamily: "Intersemibold"),
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
                                      MaterialPageRoute(
                                          builder: (context) => MoneyTracker()),
                                    );

                                    // Add your forgot password logic here
                                  },
                                  child: Center(
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 16.0,
                                          fontFamily: "Intersemibold"),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Don't have an account yet ",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.0,
                                              fontFamily: "Inter"),
                                        ),
                                        TextSpan(
                                          text: "? Sign Up",
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 16.0,
                                              fontFamily: "Intersemibold"),
                                        ),
                                      ],
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
    );
  }

  Widget _buildTextField(
      String label, IconData icon, TextEditingController controller,
      {bool isPassword = false, bool isValid = true}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        style: TextStyle(
          fontFamily:
              'Intersemibold', // This should match the family name specified in pubspec.yaml

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
          // Highlight the border if the field is not valid
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: isValid
                  ? Colors.blue
                  : Colors.red, // Change the border color for invalid fields
            ),
          ),
        ),
      ),
    );
  }

  bool _isInputValid() {
    if (isPhoneNumberValid && isPasswordValid) {
      return true;
    } else {
      return false;
    }
  }
}
