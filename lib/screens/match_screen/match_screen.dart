import 'package:bematched/config.dart';
import 'package:bematched/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImageAssets.MATCH_IMAGE,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned.fill(
              bottom: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Column(
                      children: [
                        Text(
                          'Congrats!',
                          style: TextStyle(
                            fontSize: 45,
                            fontFamily: AppFonts.INTER_SEMIBOLD,
                            color: Color(0xff33196B),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'It’s a Match\nBelle & You both liked each other!',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppFonts.INTER_MEDIUM,
                            color: Color(0xff645290),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        SvgPicture.asset(SvgAssets.MESSAGE_ICON),
                        const Text(
                          'Start Conversation',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: AppFonts.INTER_SEMIBOLD,
                            color: AppColors.themeColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 21),
                    Image.asset(ImageAssets.KEEP_DATING),
                    SizedBox(height: Get.height * 0.04),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
