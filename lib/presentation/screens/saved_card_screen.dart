import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/presentation/screens/add_new_card_screen.dart';
import 'package:fyp_project_group_a/presentation/screens/detail_card_screen.dart';
import 'package:fyp_project_group_a/presentation/widgets/app_setting_button.dart';
import 'package:fyp_project_group_a/presentation/widgets/saved_card_widget.dart';
import 'package:fyp_project_group_a/presentation/widgets/topbar.dart';

class SavedCardScreen extends StatelessWidget {
  const SavedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Column(
          children: [
            const TopBar(title: 'Saved Card'),
            SavedCardWidget(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailCardScreen()) // Removes all routes from the stack
                    );
              },
              imagePath: 'assets/images/Logo.png',
              firstText: 'MasterCard',
              secondText: '4246 7515 4574 5534',
            ),
            SavedCardWidget(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailCardScreen()) // Removes all routes from the stack
                    );
              },
              imagePath: 'assets/images/Logo1.png',
              firstText: 'Visa',
              secondText: '4246 7515 4574 5534',
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 56,
              width: 327,
              margin: const EdgeInsets.only(left: 24, right: 24),
              child: AppSettingButton(
                firstIcon: Image.asset('assets/images/Plus.png'),
                firstText: 'Add New Card',
                secondIcon: Image.asset('assets/images/Right.png'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewCardScreen()) // Removes all routes from the stack
                      );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
