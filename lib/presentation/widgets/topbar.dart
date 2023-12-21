import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';

class TopBar extends StatelessWidget {
  final String title;

  const TopBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      color: primaryColorBlue,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: secondaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 120),
            child: Center(
              child: Text(
                title,
                style: MyTextStyles.parentTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
