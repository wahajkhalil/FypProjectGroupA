import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';
import 'package:fyp_project_group_a/presentation/screens/contact_screen.dart';
import 'package:fyp_project_group_a/presentation/screens/help_screen.dart';
import 'package:fyp_project_group_a/presentation/screens/privacy_policy_screen.dart';
import 'package:fyp_project_group_a/presentation/screens/profile_setting_screen.dart';
import 'package:fyp_project_group_a/presentation/screens/saved_card_screen.dart';
import 'package:fyp_project_group_a/presentation/screens/terms_and_conditions_screen.dart';
import 'package:fyp_project_group_a/presentation/widgets/app_setting_button.dart';
import 'package:fyp_project_group_a/presentation/widgets/custom_button.dart';
import 'package:fyp_project_group_a/presentation/widgets/user_avatar.dart';

class MainProfileScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MainProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: Stack(
          children: [
            Container(
              height: 167,
              decoration: const BoxDecoration(
                color: Color(0xFF357AFF),
                // gradient: LinearGradient(
                //   colors: [
                //     primaryColorBlue,
                //     secondaryColor,
                //     gradientColor, // Adjust the shade color here
                //   ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   stops: const [0.5, 1.1, 1.2], // Adjust the stop values as needed
                //   tileMode: TileMode.clamp,
                // ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSettingScreen()) // Removes all routes from the stack
                  ),
              child: const UserProfileCard(),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 200,
                left: 24,
              ),
              child: AppSettingsList(),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: 327,
      margin: const EdgeInsets.only(top: 116, left: 24),
      child: Card(
        color: secondaryColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          children: [
            UserAvatar(
              containerHeight: 60,
              containerWidth: 60,
              avatarHeight: 30,
              avatarWidth: 30,
              avatarRadius: 50,
            ),
            UserData(),
          ],
        ),
      ),
    );
  }
}

class UserData extends StatelessWidget {
  const UserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Samantha Zalora',
          style: MyTextStyles.bold18Black,
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          'click here to edit profile',
          style: MyTextStyles.regular14Grey,
        ),
      ],
    );
  }
}

class AppSettingsList extends StatelessWidget {
  const AppSettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 56 * 9,
      child: ListView(
        children: [
          CustomButton(
            firstIcon: Image.asset('assets/images/Estimate.png'),
            firstText: 'Balance',
            secondText: '\$56,000.00',
            secondIcon: Image.asset('assets/images/Right.png'),
          ),
          const SizedBox(height: 20),
          CustomButton(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SavedCardScreen()) // Removes all routes from the stack
                  );
            },
            firstIcon: Image.asset('assets/images/Credit_card.png'),
            firstText: 'Saved Cards',
            secondText: '2 Cards',
            secondIcon: Image.asset('assets/images/Right.png'),
          ),
          const SizedBox(height: 20),
          CustomButton(
            firstIcon: Image.asset('assets/images/Data_transfer.png'),
            firstText: 'Referral Code',
            secondText: '3 Invitations',
            secondIcon: Image.asset('assets/images/Right.png'),
          ),
          const SizedBox(height: 30),
          Text(
            'App Setting',
            style: MyTextStyles.bold18Black,
          ),
          const SizedBox(height: 20),
          AppSettingButton(
            firstIcon: Image.asset('assets/images/Lock.png'),
            firstText: 'Security Pin',
            secondIcon: Image.asset('assets/images/Right.png'),
          ),
          const SizedBox(height: 20),
          AppSettingButton(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HelpScreen()) // Removes all routes from the stack
                  );
            },
            firstIcon: Image.asset('assets/images/Help.png'),
            firstText: 'Help',
            secondIcon: Image.asset('assets/images/Right.png'),
          ),
          const SizedBox(height: 20),
          AppSettingButton(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()) // Removes all routes from the stack
                ),
            firstIcon: Image.asset('assets/images/Terms_and_conditions.png'),
            firstText: 'Terms and Conditions',
            secondIcon: Image.asset('assets/images/Right.png'),
          ),
          const SizedBox(height: 20),
          AppSettingButton(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()) // Removes all routes from the stack
                ),
            firstIcon: Image.asset('assets/images/Privacy.png'),
            firstText: 'Privacy Policy',
            secondIcon: Image.asset('assets/images/Right.png'),
          ),
          const SizedBox(height: 20),
          AppSettingButton(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactScreen()) // Removes all routes from the stack
                ),
            firstIcon: Image.asset('assets/images/Contact_us.png'),
            firstText: 'Contact',
            secondIcon: Image.asset('assets/images/Right.png'),
          ),
          const SizedBox(height: 20),
          AppSettingButton(
            firstIcon: Image.asset('assets/images/Export.png'),
            firstText: 'Logout',
            color: secondaryColorRed,
            secondIcon: Image.asset('assets/images/Right.png'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
