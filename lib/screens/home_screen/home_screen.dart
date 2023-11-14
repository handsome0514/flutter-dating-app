import 'package:bematched/screens/home_screen/bff_box.dart';
import 'package:bematched/screens/home_screen/date_box.dart';
import 'package:bematched/screens/home_screen/home_screen_controller.dart';
import 'package:bematched/screens/notifications_screen/notification_screen.dart';
import 'package:bematched/screens/status_screen/status_screen.dart';
import 'package:bematched/utils/constants.dart';
import 'package:bematched/widgets/storyview/widgets/story_view.dart';
import 'package:bematched/widgets/swipe_card.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _controller = Get.put(HomeScreenController());
  List tabWidget = [BFFBox(), DateBox(), BFFBox()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: SvgPicture.asset(
          SvgAssets.SEARCH_ICON,
          height: 22,
          width: 22,
          fit: BoxFit.scaleDown,
        ),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Get.to(() => NotificationScreen(),transition: Transition.rightToLeft);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(SvgAssets.BELL_ICON),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 42),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) => GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Get.to(
                        () => StatusScreen(
                          index: 0,
                          list: [
                            StoryItem(
                              Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(ImageAssets.GIRL_IMAGE),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              duration: const Duration(seconds: 5),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      height: 74,
                      width: 74,
                      margin:
                          EdgeInsets.only(left: index == 0 ? 16 : 0, right: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xffC4C4C4).withOpacity(.23),
                        borderRadius: BorderRadius.circular(37),
                        border:
                            Border.all(color: AppColors.themeColor, width: 2),
                        image: index == 0
                            ? null
                            : const DecorationImage(
                                image: AssetImage(ImageAssets.GIRL_IMAGE),
                                fit: BoxFit.cover,
                              ),
                      ),
                      child: index == 0
                          ? const Center(
                              child: Icon(
                                Icons.add,
                                color: AppColors.themeColor,
                                size: 29,
                                weight: 2000,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 29),
            const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'New members',
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: AppFonts.INTER_SEMIBOLD,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 13),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) => Container(
                    margin:
                        EdgeInsets.only(left: index == 0 ? 16 : 0, right: 16),
                    padding: const EdgeInsets.only(top: 12, bottom: 11),
                    width: 121,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.themeColor,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 89,
                          width: 89,
                          decoration: BoxDecoration(
                            color: const Color(0xffC4C4C4).withOpacity(.23),
                            borderRadius: BorderRadius.circular(44.2),
                            border: Border.all(
                                color: AppColors.whiteColor, width: 2),
                            image: const DecorationImage(
                              image: AssetImage(ImageAssets.homeBG),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(color: AppColors.whiteColor),
                          ),
                          child: const Center(
                            child: Text(
                              'Follow',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: AppFonts.INTER_REGULAR,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 21),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: List.generate(
                  3,
                  (index) => Expanded(
                    child: Obx(() => GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => _controller.tabIndex.value = index,
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _controller.tabIndex.value == index
                                  ? AppColors.themeColor.withOpacity(.22)
                                  : AppColors.whiteColor,
                            ),
                            child: Center(
                              child: Text(
                                _controller.tabList[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: AppFonts.INTER_REGULAR,
                                  color: AppColors.themeColor,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Obx(() => tabWidget.elementAt(_controller.tabIndex.value)),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
