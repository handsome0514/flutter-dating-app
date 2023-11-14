import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/chat_screen/chat_screen.dart';
import '../utils/constants.dart';

class InboxWidget extends StatelessWidget {
  const InboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const ChatScreen(),transition: Transition.rightToLeft);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 35, left: 18, right: 18),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 63.74,
                  width: 63.74,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      ImageAssets.homeBG,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -9,
                  right: -2,
                  child: Container(
                    padding: const EdgeInsets.all(2.5),
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 13.81,
                              fontFamily: AppFonts.INTER_REGULAR,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(width: 21),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ellen Lambert',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFonts.INTER_BOLD,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '04:04AM',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: AppFonts.INTER_REGULAR,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3.62),
                  const Text(
                    'Hey! How\'s it going?',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.INTER_REGULAR,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
