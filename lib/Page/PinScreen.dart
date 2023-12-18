import 'package:flutter/material.dart';



class PinScreen extends StatefulWidget {
  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String enteredPin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Enter your PIN',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 1; i <= 4; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: enteredPin.length >= i
                              ? Text(
                            '*',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                              : Container(),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20),
              Keypad(onDigitPressed: _onDigitPressed),
            ],
          ),
        ),
      ),
    );
  }

  void _onDigitPressed(int digit) {
    setState(() {
      if (enteredPin.length < 4) {
        enteredPin += digit.toString();
      }
    });
  }
}

class Keypad extends StatelessWidget {
  final Function(int) onDigitPressed;

  Keypad({required this.onDigitPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 1; i <= 3; i++)
              KeypadButton(
                digit: i,
                onPressed: () => onDigitPressed(i),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KeypadButton(
              digit: 4,
              onPressed: () => onDigitPressed(4),
            ),
            KeypadButton(
              digit: 5,
              onPressed: () => onDigitPressed(5),
            ),
            KeypadButton(
              digit: 6,
              onPressed: () => onDigitPressed(6),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KeypadButton(
              digit: 7,
              onPressed: () => onDigitPressed(7),
            ),
            KeypadButton(
              digit: 8,
              onPressed: () => onDigitPressed(8),
            ),
            KeypadButton(
              digit: 9,
              onPressed: () => onDigitPressed(9),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KeypadButton(
              digit: 0,
              onPressed: () => onDigitPressed(0),
            ),
          ],
        ),
      ],
    );
  }
}

class KeypadButton extends StatelessWidget {
  final int digit;
  final VoidCallback onPressed;

  KeypadButton({required this.digit, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape: CircleBorder(),
          minimumSize: Size(70, 70),
        ),
        child: Text(
          digit.toString(),
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
