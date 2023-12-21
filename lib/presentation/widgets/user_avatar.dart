import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';

class UserAvatar extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  final double avatarHeight;
  final double avatarWidth;
  final double avatarRadius;
  const UserAvatar({
    Key? key,
    required this.containerHeight,
    required this.containerWidth,
    required this.avatarHeight,
    required this.avatarWidth,
    required this.avatarRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: secondaryColorGrey,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Container(
        height: avatarHeight,
        width: avatarWidth,
        margin: const EdgeInsets.all(12),
        child: CircleAvatar(
          backgroundColor: secondaryColorGrey,
          foregroundColor: Colors.blue,
          radius: avatarRadius,
          backgroundImage: const AssetImage('assets/images/User.png'),
        ),
      ),
    );
  }
}
