import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_project_group_a/core/app_export.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatefulWidget {
  CustomPinCodeTextField({
    Key? key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  }) : super(
          key: key,
        );

  final Alignment? alignment;
  final BuildContext context;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  Function(String) onChanged;
  final FormFieldValidator<String>? validator;

  @override
  State<CustomPinCodeTextField> createState() => _CustomPinCodeTextFieldState();
}

class _CustomPinCodeTextFieldState extends State<CustomPinCodeTextField> {
  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
        appContext: widget.context,
        controller: widget.controller,
        length: 6,
        keyboardType: TextInputType.number,
        textStyle: widget.textStyle ?? const TextStyle(color: Colors.white),
        hintStyle: widget.hintStyle,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        enableActiveFill: true,
        pinTheme: PinTheme(
          fieldHeight: 16.h,
          fieldWidth: 16.h,
          shape: PinCodeFieldShape.circle,
          inactiveFillColor: theme.colorScheme.onPrimary,
          activeFillColor: Colors.white,
          selectedFillColor: theme.colorScheme.onPrimary,
          inactiveColor: Colors.transparent,
          activeColor: Colors.transparent,
          selectedColor: Colors.transparent,
        ),
        onChanged: (value) => widget.onChanged(value),
        validator: widget.validator,
      );

  void setPinValue(String value) {
    if (widget.controller != null) {
      widget.controller!.text = value;
    }
  }
}
