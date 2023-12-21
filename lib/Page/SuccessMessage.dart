import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/core/app_export.dart';
import 'package:fyp_project_group_a/widgets/app_bar/appbar_leading_image.dart';
import 'package:fyp_project_group_a/widgets/app_bar/appbar_title.dart';
import 'package:fyp_project_group_a/widgets/app_bar/custom_app_bar.dart';
import 'package:fyp_project_group_a/widgets/custom_elevated_button.dart';
import 'package:fyp_project_group_a/widgets/custom_icon_button.dart';
import 'package:fyp_project_group_a/widgets/custom_text_form_field.dart';

class SendSuccessMessageScreen extends StatefulWidget {
  const SendSuccessMessageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SendSuccessMessageScreen> createState() =>
      _SendSuccessSentInMessageScreenState();
}

class _SendSuccessSentInMessageScreenState
    extends State<SendSuccessMessageScreen> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFF1E6BFF),
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 16.v),
          padding: EdgeInsets.symmetric(vertical: 24.v),
          decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // CustomElevatedButton(
              //   width: 59.h,
              //   text: "Today",
              //   alignment: Alignment.center,
              //   buttonStyle: ,
              // ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Today",
                    style: TextStyle(fontSize: 12),
                  )),
              SizedBox(height: 10.v),
              _buildGiftCard(context),
              const Spacer(),
              SizedBox(height: 10.v),
              CustomTextFormField(
                controller: messageController,
                hintText: "Type your message",
                textInputAction: TextInputAction.done,
                prefix: CustomImageView(
                  imagePath: ImageConstant.imgIconPlus,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
                prefixConstraints: BoxConstraints(
                  maxHeight: 72.v,
                ),
                suffix: Container(
                  margin: EdgeInsets.fromLTRB(24.h, 24.v, 30.h, 24.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgIconSend,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  maxHeight: 72.v,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 44,
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgIconLeft,
        margin: EdgeInsets.only(left: 24.h),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Darwin Endeavor",
      ),
    );
  }

  /// Section Widget
  Widget _buildGiftCard(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 308.v,
        width: 341.h,
        margin: EdgeInsets.only(left: 10.h),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 199.v,
                width: 240.h,
                margin: EdgeInsets.only(top: 14.v),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(
                    8.h,
                  ),
                  border: Border.all(
                    color: appTheme.gray100,
                    width: 1.h,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 308.v,
                width: 341.h,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 120.v,
                        width: 240.h,
                        decoration: BoxDecoration(
                          color: appTheme.deepOrange400,
                          borderRadius: BorderRadius.circular(
                            8.h,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 308.v,
                        width: 311.h,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            // Align(
                            //   alignment: Alignment.center,
                            //   child: Card(
                            //     clipBehavior: Clip.antiAlias,
                            //     elevation: 0,
                            //     margin: const EdgeInsets.all(0),
                            //     color: theme.colorScheme.onPrimaryContainer,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius:
                            //           BorderRadiusStyle.circleBorder154,
                            //     ),
                            //     child: Container(
                            //       height: 308.adaptSize,
                            //       width: 308.adaptSize,
                            //       padding: EdgeInsets.symmetric(
                            //         horizontal: 64.h,
                            //         vertical: 32.v,
                            //       ),
                            //       // decoration: AppDecoration
                            //       //     .fillOnPrimaryContainer
                            //       //     .copyWith(
                            //       //   borderRadius:
                            //       //       BorderRadiusStyle.circleBorder154,
                            //       // ),
                            //       child: Stack(
                            //         alignment: Alignment.topRight,
                            //         children: [
                            //           // Align(
                            //           //   alignment: Alignment.center,
                            //           //   child: Container(
                            //           //     padding: EdgeInsets.all(50.h),
                            //           //     decoration: BoxDecoration(
                            //           //       color: Colors.transparent,
                            //           //       borderRadius: BorderRadiusStyle
                            //           //           .circleBorder90,
                            //           //     ),
                            //           //     child: Container(
                            //           //       //height: 80.adaptSize,
                            //           //       //width: 80.adaptSize,
                            //           //       padding: EdgeInsets.all(16.h),
                            //           //       decoration: BoxDecoration(
                            //           //         borderRadius: BorderRadiusStyle
                            //           //             .circleBorder40,
                            //           //       ),
                            //           //       child: CustomIconButton(
                            //           //         height: 48.adaptSize,
                            //           //         width: 48.adaptSize,
                            //           //         padding: EdgeInsets.all(12.h),
                            //           //         decoration: IconButtonStyleHelper
                            //           //             .outlineBlack,
                            //           //         alignment: Alignment.center,
                            //           //         child: CustomImageView(
                            //           //           imagePath:
                            //           //               ImageConstant.imgIconLove,
                            //           //         ),
                            //           //       ),
                            //           //     ),
                            //           //   ),
                            //           // ),
                            //           Align(
                            //             alignment: Alignment.topRight,
                            //             child: Padding(
                            //               padding: EdgeInsets.only(right: 34.h),
                            //               child: Column(
                            //                 mainAxisSize: MainAxisSize.min,
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: [
                            //                   Text(
                            //                     "You’ve sent",
                            //                     style:
                            //                         theme.textTheme.bodySmall,
                            //                   ),
                            //                   SizedBox(height: 6.v),
                            //                   Text(
                            //                     "10,000.00",
                            //                     style: CustomTextStyles
                            //                         .titleMediumBold,
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Thank You",
                                    style: CustomTextStyles
                                        .titleMediumOnPrimaryContainer,
                                  ),
                                  SizedBox(height: 5.v),
                                  Text(
                                    "Darwin Endeavor",
                                    style: theme.textTheme.labelLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // CustomElevatedButton(
                    //   height: 24.v,
                    //   width: 50.h,
                    //   text: "Sent",
                    //   margin: EdgeInsets.only(
                    //     top: 40.v,
                    //     right: 16.h,
                    //   ),
                    //   buttonStyle: CustomButtonStyles.fillGreen,
                    //   buttonTextStyle: CustomTextStyles.bodyMediumPrimary,
                    //   alignment: Alignment.topRight,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
