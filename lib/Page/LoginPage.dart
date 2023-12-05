import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
                      'assets/images/Pattern.png', // Path to your second image asset
                     ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Image.asset(
                            'assets/images/Logo_App.png', // Path to your image asset
                            height: 150, // Adjust the height according to your needs
                            width: 150, // Fit within the available space
                          ),
                        ),
                      ),
                      Container(
                        height: 700,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(80.0),
                            topRight: Radius.circular(80.0),
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
                                  padding: const EdgeInsets.only(top: 20, left: 20),
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
                            const SizedBox(height: 20.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: _buildTextField('Login ID', Icons.person),
                            ),
                             Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: _buildTextField('Password', Icons.lock, isPassword: false),
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              height: 56,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your sign-in logic here
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
                            )
                            ,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
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
                            )
                            ,
                            // ... other widgets ...

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
                            )

                          ],
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

  Widget _buildTextField(String label, IconData icon, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
