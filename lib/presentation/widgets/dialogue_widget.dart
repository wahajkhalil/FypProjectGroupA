import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const CustomDialog({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        margin: const EdgeInsets.only(left: 48),
        child: child,
      ),
    );
  }
}
