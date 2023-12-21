import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';
import 'package:fyp_project_group_a/presentation/widgets/heading_text.dart';
import 'package:fyp_project_group_a/presentation/widgets/saved_card_widget.dart';
import 'package:fyp_project_group_a/presentation/widgets/topbar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: Column(
          children: [
            const TopBar(title: 'Contact'),
            const HeadingText(text: 'Contact'),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              child: Text(
                'We always ready to help you from Monday until Friday on 09.00 AM until 05.00 PM. Contact us with this following contact:',
                style: MyTextStyles.paragraphTextStyle,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const SavedCardWidget(
              imagePath: 'assets/images/Icon.png',
              firstText: 'Email',
              secondText: 'BWallet@gmail.com',
            ),
            const SizedBox(
              height: 10,
            ),
            const SavedCardWidget(
              imagePath: 'assets/images/Icon1.png',
              firstText: 'Whatsapp',
              secondText: '3236313975',
            ),
          ],
        ),
      ),
    );
  }
}
