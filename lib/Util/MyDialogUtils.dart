import 'package:flutter/material.dart';

class MyDialogUtils {
  static void displayDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red, // Set the background color to red
          content: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
    );

    // Close the dialog after 1 second
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }
}