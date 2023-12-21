import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';
import 'package:fyp_project_group_a/presentation/widgets/profile_button.dart';
import 'package:fyp_project_group_a/presentation/widgets/profile_setting_widget.dart';
import 'package:fyp_project_group_a/presentation/widgets/topbar.dart';
import 'package:fyp_project_group_a/presentation/widgets/user_avatar.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: Column(
          children: [
            const TopBar(title: 'Profile Setting'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildAvatarSection(),
                    _buildTextFieldContainers(),
                    const SizedBox(height: 20),
                    ProfileButton(
                      text: 'Save Changes',
                      mainContainerColor: secondaryColorGrey,
                      textColor: greycolor,
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

  Widget _buildAvatarSection() {
    return Stack(
      children: [
        const UserAvatar(
          containerHeight: 97,
          containerWidth: 105,
          avatarHeight: 58.2,
          avatarWidth: 58.2,
          avatarRadius: 100,
        ),
        Positioned(
          top: 70,
          left: 90,
          child: Container(
            padding: const EdgeInsets.all(4),
            child: Image.asset(
              'assets/images/Button_Picture.png',
              width: 40,
              height: 40,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextFieldContainers() {
    return Column(
      children: [
        const ProfileSettingWidget(
          labelText: 'Name',
          text: 'Samanth Glora',
          // Replace with the actual icon you want
        ),
        const ProfileSettingWidget(
          labelText: 'Email Address',
          text: 'samantha@gmail.com',
          // Replace with the actual icon you want
        ),
        const ProfileSettingWidget(
          labelText: 'Phone Number',
          text: '3236313975',
          // Replace with the actual icon you want
        ),
        ProfileSettingWidget(
          labelText: 'Birthday',
          text: '8 Match 1997',
          postfixIcon: Image.asset('assets/images/Calendar.png'),
          // Replace with the actual icon you want
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
