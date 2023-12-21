import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Page/EnterPinCode.dart';
import 'package:fyp_project_group_a/core/app_export.dart';
import 'package:fyp_project_group_a/widgets/app_bar/appbar_leading_image.dart';
import 'package:fyp_project_group_a/widgets/app_bar/appbar_subtitle.dart';
import 'package:fyp_project_group_a/widgets/app_bar/custom_app_bar.dart';
import 'package:fyp_project_group_a/widgets/custom_elevated_button.dart';
import 'package:fyp_project_group_a/widgets/custom_icon_button.dart';
import 'package:fyp_project_group_a/widgets/custom_search_view.dart';

class ContactItem {
  String name;
  String phoneNumber;
  bool isChecked;

  ContactItem(this.name, this.phoneNumber, this.isChecked);
}

class SendSelectContact extends StatefulWidget {
  const SendSelectContact({Key? key}) : super(key: key);

  @override
  State<SendSelectContact> createState() => _SendSelectContactState();
}

class _SendSelectContactState extends State<SendSelectContact> {
  List<ContactItem> filteredContacts = [];
  String selectedCategory = '';
  @override
  void initState() {
    super.initState();
    filteredContacts = List.from(contactItems);
  }

  int selectedContactCount = 0;

  void updateSelectedContactCount() {
    setState(() {
      selectedContactCount =
          contactItems.where((item) => item.isChecked).length;
    });
  }

  void updateFilteredContacts(String searchText) {
    setState(() {
      filteredContacts = contactItems
          .where((item) =>
              item.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  String getSelectedContactNames() {
    List<String> selectedNames = contactItems
        .where((item) => item.isChecked)
        .map((item) => item.name)
        .toList();

    return selectedNames.join(' | ');
  }

  TextEditingController searchController = TextEditingController();

  List<ContactItem> contactItems = [
    ContactItem("Brittni Lando", "087562729263", false),
    ContactItem("Darcel Ballentine", "087562729263", false),
    ContactItem("Alfonzo Schuessler", "087562729263", false),
    ContactItem("Willard Purnell", "087562729263", false),
    ContactItem("Muslim", "087562729263", false),
    ContactItem("ALi", "087562729263", false),
    ContactItem("ABC", "087562729263", false),
  ];
  void _showCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      elevation: 0,
      context: context,
      builder: (BuildContext context) {
        return _buildBottomSheetTitleColumn(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.deepPurpleA200,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SizedBox(
            width: mediaQueryData.size.width,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 175,
                      vertical: double.infinity,
                    ),
                    decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL16,
                    ),
                    child: Container(
                      height: 4.v,
                      width: 24.h,
                      decoration: BoxDecoration(
                        color: appTheme.gray100,
                        borderRadius: BorderRadius.circular(
                          2.h,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 24.h,
                      top: 43.v,
                      right: 24.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildCardAmount(context),
                        SizedBox(height: 16.v),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 32),
                          padding: const EdgeInsets.fromLTRB(16, 11, 22.37, 9),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xfff8f8f8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              selectedCategory.isNotEmpty
                                  ? InkWell(
                                      onTap: () {
                                        _showCategoryBottomSheet(context);
                                      },
                                      child: Text(
                                        selectedCategory,
                                        style: theme.textTheme.titleMedium,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        _showCategoryBottomSheet(context);
                                      },
                                      child: const Text(
                                        'Select Category',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          height: 1.7000000477,
                                          color: Color(0xffb4b4b4),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        _buildSendTo(context),
                        SizedBox(height: 24.v),
                        Expanded(
                          child: ListView(
                            children: [
                              for (var contactItem in filteredContacts)
                                _buildSelectionControlItem(
                                    context, contactItem),
                            ],
                          ),
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
                _buildSendButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 44,
      leadingWidth: 48,
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

  Widget _buildCardAmount(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.outlineBluegray100.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: CustomIconButton(
              height: 56.adaptSize,
              width: 56.adaptSize,
              padding: EdgeInsets.all(16.h),
              decoration: IconButtonStyleHelper.fillPrimary,
              child: CustomImageView(
                imagePath: ImageConstant.imgIconUpward,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Number of Send",
                  style: CustomTextStyles.bodyMediumGray500_1,
                ),
                SizedBox(height: 8.v),
                Text(
                  "10,000.00",
                  style: CustomTextStyles.headlineSmallPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendTo(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Send to",
              style: CustomTextStyles.titleMediumSemiBold,
            ),
            Opacity(
              opacity: 0.7,
              child: Text(
                "$selectedContactCount selected",
                style: CustomTextStyles.bodyLargeGray500,
              ),
            ),
          ],
        ),
        SizedBox(height: 19.v),
        CustomSearchView(
          controller: searchController,
          hintText: "Type to search contact |  ${getSelectedContactNames()}",
          onChanged: (text) {
            updateFilteredContacts(text);
          },
        ),
      ],
    );
  }

  Widget _buildSelectionControlItem(
      BuildContext context, ContactItem contactItem) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 23.h,
            vertical: 15.v,
          ),
          decoration: contactItem.isChecked
              ? AppDecoration.outlinePrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                )
              : AppDecoration.outlineBluegray100.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFortyTwo(context),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 3.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        contactItem.name,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 7.v),
                    Text(
                      contactItem.phoneNumber,
                      style: contactItem.isChecked
                          ? CustomTextStyles
                              .bodyMediumPrimary // Change to your desired text style
                          : CustomTextStyles.bodyMediumGray500,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Checkbox(
                value: contactItem.isChecked,
                activeColor: const Color(0XFFFF6853),
                onChanged: (value) {
                  setState(() {
                    contactItem.isChecked = value ?? false;
                    updateSelectedContactCount();
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 16.v), // Add space between items
      ],
    );
  }

  Widget _buildSendButton(BuildContext context) {
    bool isButtonEnabled =
        selectedCategory.isNotEmpty && selectedContactCount > 0;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.all(24.h),
        decoration: AppDecoration.outlineBlack,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomElevatedButton(
              height: 56.v,
              text: "Send",
              onPressed: isButtonEnabled
                  ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SendEnterPinScreen()));
                    }
                  : null,
              buttonStyle: isButtonEnabled
                  ? CustomButtonStyles.fillPrimary
                  : CustomButtonStyles.fillGray,
              buttonTextStyle: isButtonEnabled
                  ? CustomTextStyles.titleMediumOnPrimaryContainerSemiBold
                  : CustomTextStyles.titleMediumGray400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFortyTwo(BuildContext context) {
    return SizedBox(
      height: 48.adaptSize,
      width: 48.adaptSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage,
            height: 48.adaptSize,
            width: 48.adaptSize,
            radius: BorderRadius.circular(
              24.h,
            ),
            alignment: Alignment.center,
          ),
          CustomIconButton(
            height: 48.adaptSize,
            width: 48.adaptSize,
            padding: EdgeInsets.all(9.h),
            alignment: Alignment.center,
            child: CustomImageView(
              imagePath: ImageConstant.imgIconUser,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheetTitleColumn(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Align(
        //alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 27.v),
          padding: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 16.v,
          ),
          decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 4.v,
                  width: 24.h,
                  decoration: BoxDecoration(
                    color: appTheme.gray100,
                    borderRadius: BorderRadius.circular(
                      2.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 17.v),
              Text(
                "Category",
                style: CustomTextStyles.titleLargeBlack900,
              ),
              SizedBox(height: 23.v),
              Wrap(
                runSpacing: 0,
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Food & Drink',
                      style: theme.textTheme.titleMedium,
                    ),
                    leading: Radio(
                      value: 'Food & Drink',
                      groupValue: selectedCategory,
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                        Navigator.pop(context);
                      },
                      activeColor: const Color(0XFFFF6853),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Expense',
                      style: theme.textTheme.titleMedium,
                    ),
                    leading: Radio(
                      value: 'Expense',
                      groupValue: selectedCategory,
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                        Navigator.pop(context);
                      },
                      activeColor: const Color(0XFFFF6853),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Property',
                      style: theme.textTheme.titleMedium,
                    ),
                    leading: Radio(
                      value: 'Property',
                      groupValue: selectedCategory,
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                        Navigator.pop(context);
                      },
                      activeColor: const Color(0XFFFF6853),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Hobby',
                      style: theme.textTheme.titleMedium,
                    ),
                    leading: Radio(
                      value: 'Hobby',
                      groupValue: selectedCategory,
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                        Navigator.pop(context);
                      },
                      activeColor: const Color(0XFFFF6853),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Entertaintment',
                      style: theme.textTheme.titleMedium,
                    ),
                    leading: Radio(
                      value: 'Entertaintment',
                      groupValue: selectedCategory,
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                        Navigator.pop(context);
                      },
                      activeColor: const Color(0XFFFF6853),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
