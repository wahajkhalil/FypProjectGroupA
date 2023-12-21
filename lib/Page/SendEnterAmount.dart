import 'package:fyp_project_group_a/Page/SelectContect.dart';

import '../widgets/chips_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/core/app_export.dart';
import 'package:fyp_project_group_a/widgets/app_bar/appbar_leading_image.dart';
import 'package:fyp_project_group_a/widgets/app_bar/appbar_subtitle.dart';
import 'package:fyp_project_group_a/widgets/app_bar/custom_app_bar.dart';
import 'package:fyp_project_group_a/widgets/custom_elevated_button.dart';
import 'package:fyp_project_group_a/widgets/custom_icon_button.dart';
import 'package:fyp_project_group_a/widgets/custom_outlined_button.dart';

class SendEnterAmount extends StatefulWidget {
  const SendEnterAmount({Key? key}) : super(key: key);

  @override
  State<SendEnterAmount> createState() => _SendEnterAmountState();
}

class _SendEnterAmountState extends State<SendEnterAmount> {
  late String enteredValue;

  @override
  void initState() {
    super.initState();
    enteredValue = "0.00";
  }

  void updateEnteredValue(String newValue) {
    setState(() {
      enteredValue = newValue;
    });
  }

  void clearEnteredValue() {
    setState(() {
      enteredValue = "0.00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: SizedBox.expand(
          child: Column(
            children: [
              _buildIconLeftStack(context),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 34,
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 41),
                      _buildKeypadPinColumn(context),
                      const SizedBox(height: 24),
                      CustomElevatedButton(
                        height: 50,
                        text: "Continue",
                        onPressed: () => {
                          enteredValue.isNotEmpty &&
                                  double.parse(enteredValue) > 0
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SendSelectContact()))
                              : ""
                        },
                        buttonStyle: enteredValue.isNotEmpty &&
                                double.parse(enteredValue) > 0
                            ? CustomButtonStyles.fillPrimary
                            // Enabled style
                            : CustomButtonStyles.fillGray,
                        buttonTextStyle: enteredValue.isNotEmpty &&
                                double.parse(enteredValue) > 0
                            ? CustomTextStyles
                                .titleMediumOnPrimaryContainerSemiBold
                            : CustomTextStyles.titleMediumGray400,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconLeftStack(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height * 0.45,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: AppDecoration.fillDeepPurpleA,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomAppBar(
                    leadingWidth: 48,
                    leading: AppbarLeadingImage(
                      imagePath: ImageConstant.imgIconLeft,
                      margin: const EdgeInsets.only(left: 24),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    centerTitle: true,
                    title: AppbarSubtitle(
                      text: "Send",
                    ),
                  ),
                  const SizedBox(height: 35),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      "Enter the number of Send",
                      style: CustomTextStyles.bodyMediumOnPrimaryContainer_1,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    "$enteredValue",
                    style: theme.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 99),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.separated(
                padding: EdgeInsets.only(
                  left: 24,
                  top: MediaQuery.of(context).size.height * 0.24,
                  bottom: 24,
                ),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 12,
                  );
                },
                itemCount: 4,
                itemBuilder: (context, index) {
                  final value = (index + 1) * 500;
                  return GestureDetector(
                    onTap: () {
                      updateEnteredValue("$value.00");
                    },
                    child: ChipsItemWidget(value: "$value.00"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeypadPinColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: _buildKeyFourRow(
              context,
              dynamicText1: "1",
              dynamicText2: "2",
              dynamicText3: "3",
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: _buildKeyFourRow(
              context,
              dynamicText1: "4",
              dynamicText2: "5",
              dynamicText3: "6",
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: _buildKeyFourRow(
              context,
              dynamicText1: "7",
              dynamicText2: "8",
              dynamicText3: "9",
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomOutlinedButton(
                    width: 64,
                    text: "0",
                    buttonStyle: CustomButtonStyles.outlineBlueGray,
                    buttonTextStyle: CustomTextStyles.headlineSmallBlack900,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.h),
                    child: CustomIconButton(
                      height: 64,
                      width: 64,
                      padding: const EdgeInsets.all(10),
                      decoration: IconButtonStyleHelper.outlineBlueGray,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgIconClearSymbol,
                        onTap: () => {clearEnteredValue()},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyFourRow(
    BuildContext context, {
    required String dynamicText1,
    required String dynamicText2,
    required String dynamicText3,
  }) {
    const double spaceWidth = 32.0;

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              updateEnteredValue("${dynamicText1}");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              decoration: AppDecoration.outlineBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Center(
                child: Text(
                  dynamicText1,
                  style: CustomTextStyles.headlineSmallBlack900.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: spaceWidth),
        Expanded(
          child: GestureDetector(
            onTap: () {
              updateEnteredValue("${dynamicText2}");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              decoration: AppDecoration.outlineBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Center(
                child: Text(
                  dynamicText2,
                  style: CustomTextStyles.headlineSmallBlack900.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: spaceWidth),
        Expanded(
          child: GestureDetector(
            onTap: () {
              updateEnteredValue("${dynamicText3}");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              decoration: AppDecoration.outlineBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Center(
                child: Text(
                  dynamicText3,
                  style: CustomTextStyles.headlineSmallBlack900.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
