import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/constants/app_colors.dart';

class CustomContainerWithFields extends StatefulWidget {
  final String labelText;
  final String firstFieldText;
  final String secondFieldText;
  final Function(String, String) onChanged; // Add onChanged callback

  const CustomContainerWithFields({
    Key? key,
    required this.labelText,
    required this.firstFieldText,
    required this.secondFieldText,
    required this.onChanged, // Pass onChanged callback in the constructor
  }) : super(key: key);

  @override
  State<CustomContainerWithFields> createState() => _CustomContainerWithFieldsState();
}

class _CustomContainerWithFieldsState extends State<CustomContainerWithFields> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 328,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: CustomReadOnlyTextField(
                  text: widget.firstFieldText,
                  width: 156,
                  postfixIcon: Image.asset('assets/images/Down.png'),
                  options: List.generate(12, (index) => (index + 1).toString()),
                  onChanged: (value) {
                    // Pass the value and identifier to the onChanged callback
                    widget.onChanged(value, widget.secondFieldText);
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomReadOnlyTextField(
                  text: widget.secondFieldText,
                  width: 156,
                  postfixIcon: Image.asset('assets/images/Down.png'),
                  options: List.generate(7, (index) => (2024 + index).toString()),
                  onChanged: (value) {
                    // Pass the value and identifier to the onChanged callback
                    widget.onChanged(widget.firstFieldText, value);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomReadOnlyTextField extends StatefulWidget {
  final String text;
  final double width;
  final Widget? postfixIcon;
  final List<String> options;
  final Function(String) onChanged; // Add onChanged callback

  const CustomReadOnlyTextField({
    Key? key,
    required this.text,
    required this.width,
    this.postfixIcon,
    required this.options,
    required this.onChanged, // Pass onChanged callback in the constructor
  }) : super(key: key);

  @override
  _CustomReadOnlyTextFieldState createState() => _CustomReadOnlyTextFieldState();
}

class _CustomReadOnlyTextFieldState extends State<CustomReadOnlyTextField> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: TextEditingController(text: selectedOption),
      onTap: () {
        _showOptions(context);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: secondaryColorDarkGrey,
        suffixIcon: widget.postfixIcon,
      ),
      style: TextStyle(fontSize: 16),
    );
  }

  void _showOptions(BuildContext context) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          Offset.zero,
          Offset.zero,
        ),
        Offset.zero & MediaQuery.of(context).size,
      ),
      items: widget.options.map((String option) {
        return PopupMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    ).then((selectedValue) {
      if (selectedValue != null) {
        setState(() {
          selectedOption = selectedValue;
          // Call the onChanged callback with the selected value
          widget.onChanged(selectedOption);
        });
      }
    });
  }
}
