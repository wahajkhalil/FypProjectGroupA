import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String text;

  final Color mainContainerColor;
  final Color textColor;
  final VoidCallback? onSave;
  const ProfileButton({
    Key? key,
    required this.text,
    required this.mainContainerColor,
    required this.textColor,
    this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSave,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        width: 327,
        height: 56,
        decoration: BoxDecoration(
          color: mainContainerColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textColor),
          ),
        ),
      ),
    );
  }
}
