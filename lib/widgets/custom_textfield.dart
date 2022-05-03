import 'package:flutter/material.dart';
import 'package:hitch_hiker_app/constants/constant_colors.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  final String hintText;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: ConstantColors.white.withOpacity(0.5),
      ),
      cursorColor: ConstantColors.white,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: ConstantColors.white.withOpacity(0.5),
          fontSize: 18.0,
        ),
        fillColor: ConstantColors.textfieldColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: ConstantColors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
