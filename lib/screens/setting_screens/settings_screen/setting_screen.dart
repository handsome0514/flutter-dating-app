import 'package:bematched/screens/setting_screens/settings_screen/setting_screen_controller.dart';
import 'package:bematched/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/animated_container_switch.dart';
import '../../../widgets/custom_button.dart';
import '../change_password_screen/change_password_screen.dart';
import '../resources_screen/resources_screen.dart';
import '../social_media_screen/social_media_screen.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  SettingScreenController _controller = Get.put(SettingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.DARK_BLUE,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.INTER_SEMIBOLD,
              color: AppColors.DARK_BLUE),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 25, bottom: 62),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.INTER_MEDIUM,
                    color: AppColors.DARK_BLUE,
                  ),
                ),
              ),

              //***************************************
              //           NEW MESSAGES
              //****************************************

              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.GREY.withOpacity(.5)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 19, bottom: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'New Messages',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFonts.INTER_REGULAR,
                          color: AppColors.DARK_BLUE,
                        ),
                      ),
                      Obx(
                        () => AnimatedContainerSwitch(
                          ison: _controller.isNewMessage.value,
                          onChanged: (bool value) {
                            _controller.isNewMessage.value = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //***************************************
              //           NEW MATCHES
              //****************************************

              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.GREY.withOpacity(.5)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 19, bottom: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'New Matches',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFonts.INTER_REGULAR,
                          color: AppColors.DARK_BLUE,
                        ),
                      ),
                      Obx(
                        () => AnimatedContainerSwitch(
                          ison: _controller.isNewMatch.value,
                          onChanged: (bool value) {
                            _controller.isNewMatch.value = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //***************************************
              //           GET NOTIFIED IN APP
              //****************************************

              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.GREY.withOpacity(.5)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 19, bottom: 19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Get notified in the app',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFonts.INTER_REGULAR,
                          color: AppColors.DARK_BLUE,
                        ),
                      ),
                      Obx(
                        () => AnimatedContainerSwitch(
                          ison: _controller.getNofifiedinApp.value,
                          onChanged: (bool value) {
                            _controller.getNofifiedinApp.value = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Security and Membership',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.INTER_MEDIUM,
                    color: AppColors.DARK_BLUE,
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Get.to(() => ChangePasswordScreen());
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.GREY.withOpacity(.5)),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 19, bottom: 19),
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFonts.INTER_REGULAR,
                        color: AppColors.DARK_BLUE,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.GREY.withOpacity(.5)),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 19, bottom: 19),
                  child: Text(
                    'Membership Plan',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFonts.INTER_REGULAR,
                      color: AppColors.DARK_BLUE,
                    ),
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Get.to(() => const SocialMediaScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.themeColor.withOpacity(.5),
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 23, right: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Social Media',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: AppFonts.INTER_REGULAR,
                            color: AppColors.BLACK,
                          ),
                          textDirection: TextDirection.ltr,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                          color: AppColors.BLACK,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Get.to(() => const ResourcesScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.themeColor.withOpacity(.5),
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 23, right: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Resources',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: AppFonts.INTER_REGULAR,
                            color: AppColors.BLACK,
                          ),
                          textDirection: TextDirection.ltr,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                          color: AppColors.BLACK,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Contact us',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.INTER_REGULAR,
                      color: AppColors.themeColor,
                      decoration: TextDecoration.underline),
                ),
              ),
              const SizedBox(height: 56),
               CustomButton(
                buttonColor: AppColors.themeColor,
                textColor: AppColors.WHITE,
                buttonLabel: 'Log Out',
                onTap: _controller.signOut,
              ),
              const SizedBox(height: 16),
              CustomButton(
                buttonColor: AppColors.themeColor.withOpacity(.5),
                textColor: AppColors.themeColor,
                buttonLabel: 'Delete Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
