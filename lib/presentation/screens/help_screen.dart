import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';
import 'package:fyp_project_group_a/presentation/screens/wallet_app_screen.dart';
import 'package:fyp_project_group_a/presentation/widgets/help_widget.dart';
import 'package:fyp_project_group_a/presentation/widgets/topbar.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: Column(
          children: [
            const TopBar(title: 'Help'),
            TextWithIconWidget(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WalletAppScreen()) // Removes all routes from the stack
                  ),
              text: 'What is B-Wallet App?',
            ),
            const TextWithIconWidget(
              text: 'General Information',
            ),
            const TextWithIconWidget(
              text: 'Top up',
            ),
            const TextWithIconWidget(
              text: 'Request ',
            ),
            const TextWithIconWidget(
              text: 'Send',
            ),
            const TextWithIconWidget(
              text: 'Claim Promo',
            ),
            const TextWithIconWidget(
              text: 'Security Pin',
            ),
            const TextWithIconWidget(
              text: 'Payment',
            )
          ],
        ),
      ),
    );
  }
}
