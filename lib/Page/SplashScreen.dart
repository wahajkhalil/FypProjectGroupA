import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Page/LoginPage.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay using Future.delayed
    Future.delayed(
      Duration(seconds: 2),
          () {
        // // Navigate to the login screen after the delay
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF1F6CFF), // Set the background color here
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          SizedBox(height: 150),
            Center(
              child: Image.asset(
                'assets/images/Logo.png', // Path to your first image asset
                height: 150, // Adjust the height according to your needs
                width: 150, // Fit within the available space
              ),
            ),
            Image.asset(
              'assets/images/B-Wallet.png', // Path to your first image asset
              height: 50, // Adjust the height according to your needs
              width: 50, // Fit within the available space
            ),
            SizedBox(height: 20), // Adjust the spacing between the two images
          Container(
            margin: EdgeInsetsDirectional.only(top: 140 ),
            alignment: Alignment.bottomCenter,

            child: Text("Your best choice for e-wallet"
            ,style: TextStyle(color: Colors.white,fontSize:20 )),
          ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/Pattern.png', // Path to your second image asset
                  fit: BoxFit.cover, // Stretch the image horizontally
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
