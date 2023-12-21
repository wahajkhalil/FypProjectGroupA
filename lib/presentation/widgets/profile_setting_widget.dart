import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';

class ProfileSettingWidget extends StatefulWidget {
  final String? labelText;
  final String text;
  final Image? postfixIcon;
  final Widget? widget;
  final double? width;
  final Function()? onTap;
  final Function(String)? onChanged;

  const ProfileSettingWidget({
    Key? key,
    this.labelText,
    required this.text,
    this.postfixIcon,
    this.widget,
    this.width,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  _ProfileSettingWidgetState createState() => _ProfileSettingWidgetState();
}

class _ProfileSettingWidgetState extends State<ProfileSettingWidget> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.text;
  }

  @override
  void didUpdateWidget(covariant ProfileSettingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.labelText != oldWidget.labelText) {
      _textEditingController.text = widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: secondaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              onChanged: (value) {
                // Handle changes in the text
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
              readOnly: widget.labelText != 'Card Number',
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: secondaryColorDarkGrey,
                hintText: widget.labelText == 'Card Number' ? 'Enter Card Number' : null,
                suffixIcon: widget.labelText == 'Card Number'
                    ? null
                    : GestureDetector(
                        onTap: () {
                          // Show options when postfixIcon is tapped
                          _showOptions(context);
                        },
                        child: widget.postfixIcon,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showOptions(BuildContext context) {
    // Display a popup menu with options based on the type of field
    if (widget.labelText == 'Choose card') {
      _showCardOptions(context);
    } else if (widget.labelText == 'CVC') {
      _showCVCOptions(context);
    }
  }

  void _showCardOptions(BuildContext context) {
    final List<String> cardOptions = ['Master Card', 'Visa Card', 'American Express'];

    showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          Offset.zero,
          Offset.zero,
        ),
        Offset.zero & MediaQuery.of(context).size,
      ),
      items: cardOptions.map((String option) {
        return PopupMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    ).then((selectedValue) {
      if (selectedValue != null) {
        setState(() {
          _textEditingController.text = selectedValue;
          if (widget.onChanged != null) {
            widget.onChanged!(selectedValue);
          }
        });
      }
    });
  }

  void _showCVCOptions(BuildContext context) {
    final List<String> cvcOptions = ['233', '245', '345', '567'];

    showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          Offset.zero,
          Offset.zero,
        ),
        Offset.zero & MediaQuery.of(context).size,
      ),
      items: cvcOptions.map((String option) {
        return PopupMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    ).then((selectedValue) {
      if (selectedValue != null) {
        setState(() {
          _textEditingController.text = selectedValue;
          if (widget.onChanged != null) {
            widget.onChanged!(selectedValue);
          }
        });
      }
    });
  }
}
