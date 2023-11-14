import 'package:bematched/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../config.dart';
import '../screens/profile_screen/profile_screen.dart';
import '../utils/constants.dart';

class DateSwipeCard extends StatelessWidget {
  const DateSwipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProfileScreen(userModel: UserModel()),
            transition: Transition.rightToLeft);
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 11, left: 14, right: 14, bottom: 15),
        height: 523,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: const DecorationImage(
            image: AssetImage(ImageAssets.homeBG),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 4, left: 8, right: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: const Color(0xff2AAC7A))),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xff2AAC7A).withOpacity(.4)),
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          height: 4,
                          width: 4,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff2AAC7A)),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Text(
                        'Active Now',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: AppFonts.INTER_MEDIUM,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(SvgAssets.DATE_LIKE_ICON)
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Garima Bandari, 23',
                  style: GoogleFonts.abhayaLibre(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                const Text(
                  'San Francisco • 20 kms away',
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColors.whiteColor,
                      fontFamily: AppFonts.INTER_REGULAR),
                ),
                Text(
                  'Waiting for someone who would be my best partner ',
                  style: GoogleFonts.abhayaLibre(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
