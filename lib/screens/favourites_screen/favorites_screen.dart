import 'package:bematched/screens/favourites_screen/favorites_screen_controller.dart';
import 'package:bematched/utils/constants.dart';
import 'package:flutter_svg/svg.dart';

import '../../config.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final _controller = Get.put(FavoritesScreenController());

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
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(SvgAssets.BELL_ICON),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 42),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    10,
                    (index) => Container(
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
                                image: AssetImage(ImageAssets.homeBG),
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
              const SizedBox(height: 42),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  _controller.optionList.length,
                  (index) => Obx(
                    () => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        _controller.selectedOption.value = index;
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: _controller.selectedOption.value == index
                                  ? AppColors.themeColor
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Text(
                          _controller.optionList[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: AppFonts.INTER_MEDIUM,
                            color: _controller.selectedOption.value == index
                                ? AppColors.themeColor
                                : AppColors.BLACK,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 33),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 18, right: 18),
                shrinkWrap: true,
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: .7,
                ),
                itemBuilder: (_, index) => Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        ImageAssets.homeBG,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        height: 14,
                        width: 14,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffBFFF6F),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              top: 7, bottom: 8, left: 11, right: 11),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            gradient: LinearGradient(
                                colors: [
                                  const Color(0xff120130),
                                  const Color(0xff0E0124).withOpacity(.8),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Ruby Diaz, 33',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: AppFonts.INTER_SEMIBOLD,
                                    color: AppColors.WHITE,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '1.5 km away',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppFonts.INTER_MEDIUM,
                                      color: AppColors.WHITE,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(SvgAssets.CAMERA_ICON),
                                      const SizedBox(width: 5),
                                      const Text(
                                        '1',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: AppFonts.INTER_MEDIUM,
                                          color: AppColors.WHITE,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
