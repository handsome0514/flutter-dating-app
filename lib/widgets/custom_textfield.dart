import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.hintLabel, this.onChanged});

  final String? hintLabel;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
          fontSize: 12,
          fontFamily: AppFonts.INTER_REGULAR,
          color: Colors.black),
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 13, top: 20, bottom: 20, right: 13),
        hintText: hintLabel ?? '',
        hintStyle: TextStyle(
          fontSize: 12,
          fontFamily: AppFonts.INTER_REGULAR,
          color: Colors.black.withOpacity(.40),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xffD9D9D9)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xffD9D9D9)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xffD9D9D9)),
        ),
      ),
    );
  }
}
