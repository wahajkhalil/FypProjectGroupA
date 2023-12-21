import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';

class SavedCardWidget extends StatelessWidget {
  final String imagePath;
  final String firstText;
  final String secondText;
  final VoidCallback? onTap;
  const SavedCardWidget({required this.imagePath, required this.firstText, required this.secondText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 88,
        width: 327,
        margin: const EdgeInsets.only(left: 24, right: 24, top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color.fromRGBO(215, 215, 215, 1),
            width: 1,
          ),
          color: const Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 72,
              height: 56,
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      firstText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: greyColor2,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      secondText,
                      style: TextStyle(fontSize: 16, color: secondarColorBlack, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
