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
        // Navigate to the login screen after the delay
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100),
            Center(
              child: Image.asset(
                'assets/images/Logo.png',
                height: 150,
                width: 150,
              ),
            ),
            Image.asset(
              'assets/images/B-Wallet.png',
              height: 50,
              width: 50,
            ),
            SizedBox(height: 20),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/Pattern.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: "Inter"

                ),
                "Your best choice for e-wallet",
               ),
            ),
          ],
        ),
      ),
    );
  }
}
