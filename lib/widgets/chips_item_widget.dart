import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/core/app_export.dart';

// ignore: must_be_immutable
class ChipsItemWidget extends StatelessWidget {
  final String value;
  const ChipsItemWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.h,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 84.h,
          padding: EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 12.v,
          ),
          decoration: AppDecoration.fillOnPrimaryContainer1.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder20,
          ),
          child: Text(
            " $value",
            style: theme.textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
