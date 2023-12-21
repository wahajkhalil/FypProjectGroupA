import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';

class TextWithIconWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const TextWithIconWidget({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, top: 20, bottom: 20, right: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 8), // Adjust the space between icon and text
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: secondarColorBlack,
              ),
            ),
            Spacer(),
            Image.asset(
              'assets/images/Right.png',
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: secondaryColorGrey,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
