import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';

class AppSettingButton extends StatelessWidget {
  final String firstText;
  final Color? color;
  final Image firstIcon;
  final Image secondIcon;
  final VoidCallback? onTap;
  const AppSettingButton({required this.firstText, this.color, required this.firstIcon, required this.secondIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 24.0;
    const double horizontalSpacing = 10.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
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
            // Add a spacer to push the second icon to the right
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
