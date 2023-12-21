import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Page/successmessage.dart';
import 'package:fyp_project_group_a/core/app_export.dart';
import 'package:fyp_project_group_a/widgets/app_bar/appbar_leading_image.dart';
import 'package:fyp_project_group_a/widgets/app_bar/appbar_subtitle.dart';
import 'package:fyp_project_group_a/widgets/app_bar/custom_app_bar.dart';
import 'package:fyp_project_group_a/widgets/custom_icon_button.dart';
import 'package:fyp_project_group_a/widgets/custom_outlined_button.dart';
import 'package:fyp_project_group_a/widgets/custom_pin_code_text_field.dart';
import 'package:fyp_project_group_a/widgets/custom_elevated_button.dart';

class SendEnterPinScreen extends StatefulWidget {
  const SendEnterPinScreen({super.key});

  @override
  _SendEnterPinScreenState createState() => _SendEnterPinScreenState();
}

class _SendEnterPinScreenState extends State<SendEnterPinScreen> {
  final TextEditingController pinController = TextEditingController();
  bool showtossmessage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFF1E6BFF),
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 37.h,
            vertical: 52.v,
          ),
          child: Column(
            children: [
              Text(
                "Enter the Security Pin",
                style: theme.textTheme.titleLarge,
              ),
              SizedBox(height: 6.v),
              Opacity(
                opacity: 0.7,
                child: Container(
                  width: 274.h,
                  margin: EdgeInsets.only(
                    left: 13.h,
                    right: 12.h,
                  ),
                  child: Text(
                    "Security code is used to verify your every transaction to be more secure",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumOnPrimaryContainer_1
                        .copyWith(
                      height: 1.70,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 19.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: CustomPinCodeTextField(
                  context: context,
                  controller: pinController,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 20.v),
              _buildZero(context),
              SizedBox(height: 5.v),
              SizedBox(height: 24.v),
              if (showtossmessage)
                CustomElevatedButton(
                  height: 56.v,
                  text: "The pin you entered is wrong",
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 12.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgIconBoximportant,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                  ),
                  buttonStyle: CustomButtonStyles.fillRed,
                  buttonTextStyle: CustomTextStyles.bodyLargeOnPrimaryContainer,
                ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 44,
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgIconLeft,
        margin: EdgeInsets.only(left: 24.h),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "Send",
      ),
    );
  }

  Widget _buildZero(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 21.h),
      child: Column(
        children: [
          Text(
            "Forgot Pin?",
            style: CustomTextStyles.bodyMediumOnPrimaryContainer,
          ),
          SizedBox(height: 32.v),
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: Column(
              children: [
                _buildKeypadPin(
                  context,
                  dynamicText1: "1",
                  dynamicText2: "2",
                  dynamicText3: "3",
                ),
                SizedBox(height: 32.v),
                _buildKeypadPin(
                  context,
                  dynamicText1: "4",
                  dynamicText2: "5",
                  dynamicText3: "6",
                ),
                SizedBox(height: 32.v),
                _buildKeypadPin(
                  context,
                  dynamicText1: "7",
                  dynamicText2: "8",
                  dynamicText3: "9",
                ),
                SizedBox(height: 32.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomOutlinedButton(
                        width: 64,
                        text: "0",
                        buttonStyle: CustomButtonStyles.outlinewhite,
                        buttonTextStyle: CustomTextStyles.titleSmallyellow50,
                        onPressed: () {
                          _handleKeypadTap("0");
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32.h),
                        child: CustomIconButton(
                          height: 64.adaptSize,
                          width: 64.adaptSize,
                          padding: EdgeInsets.all(20.h),
                          decoration:
                              IconButtonStyleHelper.outlineOnPrimaryContainer,
                          child: CustomImageView(
                            imagePath: ImageConstant
                                .imgIconClearSymbolOnprimarycontainer,
                          ),
                          onTap: () {
                            _handleClearPin();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeypadPin(
    BuildContext context, {
    required String dynamicText1,
    required String dynamicText2,
    required String dynamicText3,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            _handleKeypadTap(dynamicText1);
          },
          child: Container(
            width: 64.adaptSize,
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
              vertical: 16.v,
            ),
            decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            child: Text(
              dynamicText1,
              style: theme.textTheme.headlineSmall!.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _handleKeypadTap(dynamicText2);
          },
          child: Container(
            width: 64.adaptSize,
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
              vertical: 16.v,
            ),
            decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            child: Text(
              dynamicText2,
              style: theme.textTheme.headlineSmall!.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _handleKeypadTap(dynamicText3);
          },
          child: Container(
            width: 64.adaptSize,
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
              vertical: 16.v,
            ),
            decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            child: Text(
              dynamicText3,
              style: theme.textTheme.headlineSmall!.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _handleKeypadTap(String value) {
    final currentPin = pinController.text;
    setState(() {
      pinController.text = '$currentPin$value';
      if (pinController.text.length >= 6 && pinController.text != '123456') {
        showtossmessage = true;
      }
      if (pinController.text == '123456') {
        //Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SendSuccessMessageScreen(),
          ),
        );
        //});
      }
    });
  }

  void _handleClearPin() {
    setState(() {
      pinController.clear();
      showtossmessage = false;
    });
  }
}
