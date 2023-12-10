import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Util/MyDialogUtils.dart';

class ResetPasswordScreen extends StatefulWidget {
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
                textAlign: TextAlign.center,
                'Create Your Password',
                style: TextStyle(fontFamily: "Inter-Medium", fontSize: 20),
              ),
              SizedBox(height: 8),
              Text(
                textAlign: TextAlign.center,

                'Enter a new password to reset your account',
                style: TextStyle(fontFamily: "Inter", fontSize:14),
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
              Spacer( ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {

                    MyDialogUtils.showGenericDialogPositive(
                      context: context,
                      title: 'Yay! Your new password has been saved',
                      onConfirmPressed: (value) {
                        print('User entered: $value');
                      },
                    );

                    // Implement your logic for resetting the password here
                    // You can check the isEmailValid to determine whether the email is valid
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
