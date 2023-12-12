import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Page/LoginPage.dart';
import 'package:fyp_project_group_a/Util/MyDialogUtils.dart';

import '../DB/DatabaseHelper.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;

  ResetPasswordScreen({required this.email});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1F6CFF),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'Create Your Password: ${widget.email}',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Inter-Medium", fontSize: 20),
              ),
              SizedBox(height: 8),
              Text(
                'Enter a new password to reset your account',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Inter", fontSize: 14),
              ),
              SizedBox(height: 20),
              _buildPasswordTextField(
                controller: newPasswordController,
                labelText: 'New Password',
              ),
              SizedBox(height: 12),
              _buildPasswordTextField(
                controller: confirmPasswordController,
                labelText: 'Confirm Password',
              ),
              SizedBox(height: 20),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    // Validate that the passwords match
                    if (newPasswordController.text != confirmPasswordController.text) {
                      // Show an error dialog
                      MyDialogUtils.showGenericDialogNegative(
                        context: context,
                        title: 'Passwords do not match. Please try again.',
                        onConfirmPressed: (value) {
                          print('User entered: $value');
                        },
                      );

                      return;
                    }

                    // Update the password in the local database
                    await DatabaseHelper().updatePassword(widget.email, newPasswordController.text);

                    // Show a success dialog

                    MyDialogUtils.showGenericDialogPositive(
                      context: context,
                      title: 'Your new password has been saved.',
                      onConfirmPressed: (value) {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );

                       },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
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
      ),
    );
  }

  Widget _buildPasswordTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        // Implement your password validation logic here
        // You can use the value provided and return an error message if needed
        return null;
      },
    );
  }
}
