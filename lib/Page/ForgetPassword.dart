import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Page/ResetPassword.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  bool isEmailValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1F6CFF),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/Icon.png',
              height: 150,
              width: 150,
            ),
            SizedBox(height: 20),
            Text(
              "Enter Your Email Address",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Inter-Medium", fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              "We’ll send you a link to reset your password.",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Inter", fontSize: 14),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                ),
                labelText: 'Enter Your Email Address',
                errorText: isEmailValid ? null : 'Please enter a valid email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey), // Set border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Set focused border color
                ),
              ),
              style: TextStyle(
                fontFamily: 'Intersemibold',
              ),
              validator: (value) {
                setState(() {
                  isEmailValid = RegExp(
                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                  ).hasMatch(value ?? '');
                });
                return null;
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                  );

                  // Implement your logic for resetting the password here
                  // You can check the isEmailValid to determine whether the email is valid
                },
                style: ElevatedButton.styleFrom(
                  primary: isEmailValid ? Colors.orange : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Reset Password',
                  style: TextStyle(color: Colors.white, fontFamily: "Intersemibold"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
