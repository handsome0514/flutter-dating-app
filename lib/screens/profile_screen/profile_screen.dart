import 'package:bematched/models/user_model.dart';
import 'package:bematched/screens/match_screen/match_screen.dart';
import 'package:bematched/screens/profile_screen/profile_screen_controller.dart';
import 'package:bematched/screens/setting_screens/settings_screen/setting_screen.dart';
import 'package:bematched/utils/app_cache_image.dart';
import 'package:bematched/utils/constants.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key, this.isMyProfile, required this.userModel});

  final UserModel userModel;

  final bool? isMyProfile;

  final _controller = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                AppCacheImage(
                  imageUrl: userModel.profileImage ?? '',
                  width: double.infinity,
                  height: Get.height / 2,
                ),
                if ((isMyProfile ?? false))
                  Positioned(
                    top: 45,
                    right: 20,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.to(() => SettingScreen(),
                            transition: Transition.rightToLeft);
                      },
                      child: SvgPicture.asset(
                        SvgAssets.SETTING_ICON,
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                        color: AppColors.BLACK,
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 80,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: AppColors.WHITE,
                    ),
                  ),
                ),
                if (!(isMyProfile ?? false))
                  Positioned.fill(
                    bottom: 35,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          PhysicalModel(
                            color: AppColors.themeColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(37),
                            elevation: 6,
                            child: Container(
                              height: 78,
                              width: 78,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(37),
                                color: AppColors.WHITE,
                              ),
                              child: Center(
                                child: SvgPicture.asset(SvgAssets.CLOSE_ICON),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          PhysicalModel(
                            color: AppColors.themeColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(37),
                            elevation: 6,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => const MatchScreen());
                              },
                              child: Container(
                                height: 99,
                                width: 99,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(47.5),
                                  color: AppColors.themeColor,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    SvgAssets.HEART_ICON,
                                    height: 36,
                                    width: 42,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          PhysicalModel(
                            color: AppColors.themeColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(37),
                            elevation: 6,
                            child: Container(
                              height: 78,
                              width: 78,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(37),
                                color: AppColors.WHITE,
                              ),
                              child: Center(
                                child: SvgPicture.asset(SvgAssets.STAR_ICON),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (!(isMyProfile ?? false))
                  Positioned(
                    top: 45,
                    left: 15,
                    child: GestureDetector(
                      onTap: Get.back,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 19, bottom: 19, left: 21.5, right: 22.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(0xffE8E6EA),
                          ),
                          color: AppColors.WHITE.withOpacity(.2),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: AppColors.whiteColor,
                          size: 14,
                        ),
                      ),
                    ),
                  )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 18, right: 18),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.WHITE,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                '${userModel.name}, ${userModel.age}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontFamily: AppFonts.INTER_BOLD,
                                  color: AppColors.BLACK,
                                ),
                              ),
                         /*     Text(
                                'Proffesional model',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppFonts.INTER_REGULAR,
                                  color: AppColors.BLACK.withOpacity(.7),
                                ),
                              ),*/
                            ],
                          ),
                          if ((isMyProfile ?? false))
                            const Row(
                              children: [
                                SizedBox(width: 6),
                                Icon(Icons.edit, color: AppColors.themeColor),
                              ],
                            ),
                        ],
                      ),
                      if (!(isMyProfile ?? false))
                        Container(
                          padding: const EdgeInsets.only(
                              top: 15.5,
                              bottom: 15.5,
                              left: 16.39,
                              right: 16.39),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffE8E6EA)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            SvgAssets.SEND_ICON,
                            color: AppColors.themeColor,
                          ),
                        )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Location',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFonts.INTER_BOLD,
                                  color: AppColors.BLACK,
                                ),
                              ),
                              if ((isMyProfile ?? false))
                                const Row(
                                  children: [
                                    SizedBox(width: 6),
                                    Icon(
                                      Icons.edit,
                                      color: AppColors.themeColor,
                                      size: 15,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          Text(
                            'Chicago, IL United States',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.INTER_REGULAR,
                              color: AppColors.BLACK.withOpacity(.7),
                            ),
                          ),
                        ],
                      ),
                      if (!(isMyProfile ?? false))
                        Container(
                          padding: const EdgeInsets.only(
                              top: 13, bottom: 13, left: 15.5, right: 15.5),
                          decoration: BoxDecoration(
                            color: AppColors.themeColor.withOpacity(.2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.location_pin,
                                  color: AppColors.themeColor, size: 16),
                              SizedBox(width: 8.72),
                              Text(
                                '5 Km',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: AppFonts.INTER_BOLD,
                                  color: AppColors.themeColor,
                                ),
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                  const SizedBox(height: 28),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'About',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.INTER_BOLD,
                              color: AppColors.BLACK,
                            ),
                          ),
                          if ((isMyProfile ?? false))
                            const Row(
                              children: [
                                SizedBox(width: 6),
                                Icon(
                                  Icons.edit,
                                  color: AppColors.themeColor,
                                  size: 15,
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.only(right: Get.width * 0.25),
                        child: ExpandableText(
                          'My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading',
                          expandText: 'show more',
                          collapseText: 'show less',
                          maxLines: 3,
                          linkColor: AppColors.themeColor,
                          linkStyle: const TextStyle(
                            fontSize: 12,
                            fontFamily: AppFonts.INTER_SEMIBOLD,
                            color: AppColors.themeColor,
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.INTER_REGULAR,
                            color: AppColors.BLACK.withOpacity(.7),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          const Text(
                            'Interests',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.INTER_BOLD,
                              color: AppColors.BLACK,
                            ),
                          ),
                          if ((isMyProfile ?? false))
                            const Row(
                              children: [
                                SizedBox(width: 6),
                                Icon(
                                  Icons.edit,
                                  color: AppColors.themeColor,
                                  size: 15,
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 12,
                        runSpacing: 15,
                        direction: Axis.horizontal,
                        children: List.generate(
                          5,
                          (i) => Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: const Color(0xFFD9D9D9)),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  interests[i]["icon"],
                                  color: AppColors.themeColor,
                                  size: 25,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  interests[i]["text"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 26),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Gallery',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.INTER_BOLD,
                              color: AppColors.BLACK,
                            ),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.INTER_BOLD,
                              color: AppColors.themeColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 190,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    ImageAssets.GIRL_IMAGE,
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 13),
                          Expanded(
                            child: Container(
                              height: 190,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    ImageAssets.GIRL_IMAGE,
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 190,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    ImageAssets.GIRL_IMAGE,
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 13),
                          Expanded(
                            child: Container(
                              height: 190,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    ImageAssets.GIRL_IMAGE,
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 41),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
