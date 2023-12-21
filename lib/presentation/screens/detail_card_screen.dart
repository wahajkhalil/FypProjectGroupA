import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';
import 'package:fyp_project_group_a/presentation/widgets/dialogue_widget.dart';
import 'package:fyp_project_group_a/presentation/widgets/profile_setting_widget.dart';
import 'package:fyp_project_group_a/presentation/widgets/row_button_widget.dart';
import 'package:fyp_project_group_a/presentation/widgets/topbar.dart';

class DetailCardScreen extends StatelessWidget {
  const DetailCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: Column(
          children: [
            const TopBar(title: 'Detail Card'),
            const SizedBox(
              height: 20,
            ),
            ProfileSettingWidget(
              labelText: 'Choose Card',
              text: 'Master Card',
              postfixIcon: Image.asset('assets/images/Down.png'),
            ),
            const ProfileSettingWidget(
              labelText: 'Card Number ',
              text: '4234 4567 5676 4567',
            ),
            // const CustomContainerWithFields(
            //   labelText: 'Expiry Date',
            //   firstFieldText: '2',
            //   secondFieldText: '2022',
            // ),
            const SizedBox(
              height: 20,
            ),
            ProfileSettingWidget(
              labelText: 'CVC ',
              text: '233',
              postfixIcon: Image.asset('assets/images/Down.png'),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 24),
              child: Row(
                children: [
                  RowButtonWidget(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialog(
                            width: 178,
                            height: 148,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                                  child: Text(
                                    'Your card will be deleted, are you sure to continue',
                                  ),
                                ),
                                // SizedBox(
                                //   height: 35,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, top: 35),
                                  child: Row(
                                    children: [
                                      RowButtonWidget(
                                        width: 98,
                                        height: 40,
                                        text: 'Cancel',
                                        backgroundColor: secondaryColor,
                                        textColor: primaryColorOrange,
                                        borderColor: primaryColorOrange,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      RowButtonWidget(
                                        width: 98,
                                        height: 40,
                                        text: 'Delete',
                                        backgroundColor: primaryColorOrange,
                                        textColor: secondaryColor,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    width: 156,
                    height: 56,
                    text: 'Delete Card',
                    backgroundColor: secondaryColor,
                    textColor: primaryColorOrange,
                    borderColor: primaryColorOrange,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  RowButtonWidget(
                    width: 156,
                    height: 56,
                    text: 'Save Changes',
                    backgroundColor: secondaryColorGrey,
                    textColor: greycolor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
