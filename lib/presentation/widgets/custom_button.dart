import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Image firstIcon;
  final Image secondIcon;
  final VoidCallback? onTap;

  const CustomButton({
    required this.firstText,
    required this.secondText,
    required this.firstIcon,
    required this.secondIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const double iconSize = 24.0;
    const double horizontalSpacing = 10.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: secondaryColorGrey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 8.0,
              ),
              child: SizedBox(
                width: iconSize,
                height: iconSize,
                child: firstIcon,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                left: horizontalSpacing,
              ),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    firstText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  // Adjust as needed
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8, top: 10),
              child: Text(
                secondText,
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ), // Add a spacer to push the second icon to the right
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                width: iconSize,
                height: iconSize,
                child: secondIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
