import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({super.key, required this.isYou, required this.message});

  final bool isYou;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isYou ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        width: Get.width * 0.70,
        decoration: BoxDecoration(
          color: isYou ? AppColors.LOCATION_COLOR : AppColors.SILICON_VELLEY,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
            bottomRight: isYou ? Radius.zero : const Radius.circular(10),
            bottomLeft: isYou ? const Radius.circular(10) : Radius.zero,
          ),
        ),
        margin: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
        padding:
            const EdgeInsets.only(top: 12, bottom: 11, left: 13, right: 30),
        child:  Text(
          message,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: AppFonts.INTER_REGULAR,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
