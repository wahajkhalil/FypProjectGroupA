import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Home/bottomNavigation.dart';
import 'package:fyp_project_group_a/Util/MyDialogUtils.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  final String patternImagePath = 'assets/images/Pattern.png';

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent, // Set the background color to transparent
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white), // Show white color border
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFF1F6CFF), // Set the background color here

      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(patternImagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // Add navigation logic
                      },
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white30,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.lock,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                const Text(
                  "Enter the OTP Code",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Inter"
                   ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "Enter the code sent to your number",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                        fontFamily: "Inter"

                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                    "+93 744 795 640",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                        fontFamily: "Inter"
                        ,fontWeight: FontWeight.bold

                    ),
                  ),
                ),
                Pinput(
                  length: 4,
                  defaultPinTheme: defaultPinTheme,

                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                  onCompleted: (pin) => {
                     // MyDialogUtils.displayDialog(context, "This Worng  otp "),
                     Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => BottomNavBarScreen()) // Removes all routes from the stack
)
,          }
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
