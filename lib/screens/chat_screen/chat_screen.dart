import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/svg.dart';
import '../../utils/constants.dart';
import '../../widgets/chat_list_bottomsheet.dart';
import '../../widgets/message_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 14, bottom: 14, left: 18, right: 18),
                child: Row(
                  children: [
                    InkWell(
                        onTap: Get.back,
                        child: const Icon(Icons.arrow_back_ios_rounded)),
                    const SizedBox(width: 28),
                    Container(
                      height: 40,
                      width: 40,
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
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ellen Lambert',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: AppFonts.INTER_SEMIBOLD,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Online',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppFonts.INTER_REGULAR,
                            color: AppColors.themeColor,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(SvgAssets.AUDIO_CALL_ICON),
                    const SizedBox(width: 20),
                    SvgPicture.asset(SvgAssets.VIDEO_CALL_ICON),
                    const SizedBox(width: 20),
                    GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            ChatListBottomSheet(),
                            isScrollControlled: true,
                            persistent: true,
                            enableDrag: true,
                          );
                        },
                        behavior: HitTestBehavior.opaque,
                        child: SvgPicture.asset(SvgAssets.CHAT_LIST_ICON)),
                  ],
                ),
              ),
               const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MessageBox(
                          isYou: true, message: 'I’m actually a big guy!!'),
                      MessageBox(
                          isYou: false,
                          message:
                              ' when an unknown printer took and scrambled it to make a has survived no.'),
                      MessageBox(isYou: false, message: 'Where are you honey?'),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 22, right: 22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xffE6E8EA),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.EMOJI_ICON,
                      height: 21,
                      width: 20,
                      fit: BoxFit.scaleDown,
                    ),
                    const SizedBox(width: 19),
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: AppFonts.INTER_REGULAR,
                          color: Color(0xffA0A0A0),
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText: 'Type a message...',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            fontFamily: AppFonts.INTER_REGULAR,
                            color: Color(0xffA0A0A0),
                          ),
                          constraints: BoxConstraints(),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.LOCATION_COLOR,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(SvgAssets.SEND_ICON),
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
