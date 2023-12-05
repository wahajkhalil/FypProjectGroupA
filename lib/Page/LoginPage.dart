import 'package:flutter/material.dart';
import 'dart:core'; // Add this line to import the core library for the RegExp class

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
                        padding: const EdgeInsets.only(top:18.0),
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
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
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
                                    setState(() {
                                      // Validate each field and update the validation status
                                      isPhoneNumberValid = phoneRegex.hasMatch(phoneNumberController.text) &&
                                          phoneNumberController.text.isNotEmpty;
                                      isPasswordValid = passwordController.text.isNotEmpty;
                                    });

                                    if (_isInputValid()) {
                                      // Add your sign-in logic here
                                    } else {
                                      // Show an error message or handle empty/invalid input
                                    }
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
                                    // Add your forgot password logic here
                                  },
                                  child: Center(
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                          ),
                                        ),
                                        TextSpan(
                                          text: "? Sign Up",
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
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

  Widget _buildTextField(String label, IconData icon, TextEditingController controller,
      {bool isPassword = false, bool isValid = true}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
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
              color: isValid ? Colors.blue : Colors.red, // Change the border color for invalid fields
            ),
          ),
        ),
      ),
    );
  }

  bool _isInputValid() {
    return isPhoneNumberValid && isPasswordValid;
  }
}
