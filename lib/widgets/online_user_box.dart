import 'package:flutter/material.dart';

import '../utils/constants.dart';

class OnlineUserBox extends StatelessWidget {
  const OnlineUserBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
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
                bottom: 4,
                right: 2,
                child: Container(
                  height: 13,
                  width: 13,
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                      height: 9,
                      width: 9,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10.62),
          const Text(
            'Christopher',
            style: TextStyle(
              fontSize: 11.69,
              fontFamily: AppFonts.INTER_MEDIUM,
              color: AppColors.BLACK,
            ),
          ),
        ],
      ),
    );
  }
}
