import 'package:flutter/material.dart';

class RowButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback? onTap;
  const RowButtonWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                  width: 1.0,
                )
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
