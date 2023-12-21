import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';

class HeadingText extends StatelessWidget {
  final String text;

  const HeadingText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, top: 24, right: 24),
      height: 36,
      width: 327,
      child: Text(
        text,
        style: TextStyle(
          color: secondarColorBlack,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
    );
  }
}
