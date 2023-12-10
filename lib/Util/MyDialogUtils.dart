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


  static void showGenericDialogPositive({
    required BuildContext context,
    required String title,
    required Function(String)? onConfirmPressed,
  }) {
    TextEditingController textFieldController = TextEditingController();

    showDialog(

      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white, // Set background color to white

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/Illustration.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: 16),
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: TextStyle(
                    fontSize: 18,
                     fontFamily: "Inter",
                  ),
                ),
                SizedBox(height: 16),
                 SizedBox(height: 16),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  onPressed: () {
                    if (onConfirmPressed != null) {
                      onConfirmPressed(textFieldController.text);
                    }
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Confirm', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  static void showGenericDialogNegative({
    required BuildContext context,
    required String title,
    required Function(String)? onConfirmPressed,
  }) {
    TextEditingController textFieldController = TextEditingController();

    showDialog(

      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white, // Set background color to white

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/neg.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: 16),
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: TextStyle(
                    fontSize: 18,
                     fontFamily: "Inter",
                  ),
                ),
                SizedBox(height: 16),
                 SizedBox(height: 16),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  onPressed: () {
                    if (onConfirmPressed != null) {
                      onConfirmPressed(textFieldController.text);
                    }
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Confirm', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}