import 'package:bematched/config.dart';
import 'package:bematched/utils/constants.dart';
import 'package:bematched/widgets/select_drop_list.dart';
import 'package:bematched/widgets/singlechild_spacer_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({super.key});

  Rx<int> distance = Rx(25);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: Get.height * 0.85),
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
          color: AppColors.whiteColor),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 44),
            const Text(
              'Filter Options',
              style: TextStyle(
                fontSize: 30,
                fontFamily: AppFonts.INTER_SEMIBOLD,
                color: Color(0xff33196B),
              ),
            ),
            const SizedBox(height: 14),
            const Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Text(
                'Manage and set your preferences to find the best matches for you, keep enjoying!',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppFonts.INTER_MEDIUM,
                  color: Color(0xff645290),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Here to',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFonts.INTER_MEDIUM,
                          color: Color(0xff33196B),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SelectDropList(
                          selectedItem: 'Make New Friends',
                          itemList: const ['as', 'ds', 'as', 'yvafubaf'],
                          onSelected: (val) {}),
                    ],
                  ),
                  const SizedBox(height: 23),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Want to Meet',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFonts.INTER_MEDIUM,
                          color: Color(0xff33196B),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SelectDropList(
                          selectedItem: 'Woman',
                          itemList: const ['as', 'ds', 'as', 'yvafubaf'],
                          onSelected: (val) {}),
                    ],
                  ),
                  const SizedBox(height: 23),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Preferred Age Range',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFonts.INTER_MEDIUM,
                          color: Color(0xff33196B),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SelectDropList(
                          selectedItem: '20 - 35',
                          itemList: const ['as', 'ds', 'as', 'yvafubaf'],
                          onSelected: (val) {}),
                    ],
                  ),
                  const SizedBox(height: 23),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Preferred Language(s)',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFonts.INTER_MEDIUM,
                          color: Color(0xff33196B),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SelectDropList(
                          selectedItem: 'English, French, Bengali',
                          itemList: const ['as', 'ds', 'as', 'yvafubaf'],
                          onSelected: (val) {}),
                    ],
                  ),
                  const SizedBox(height: 23),
                  const Text(
                    'Distance Range',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.INTER_MEDIUM,
                      color: Color(0xff33196B),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '0 - ${distance.value} km',
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: AppFonts.INTER_SEMIBOLD,
                            color: AppColors.themeColor,
                          ),
                        ),
                        SfSliderTheme(
                          data: SfSliderThemeData(
                            overlayColor: Colors.transparent,
                            activeTrackHeight: 3,
                            inactiveTrackHeight: 3,
                            inactiveTrackColor: const Color(0xff964EE0),
                            activeTrackColor: AppColors.themeColor,
                            thumbRadius: 10,
                            thumbStrokeWidth: 3,
                            thumbStrokeColor: AppColors.themeColor,
                            thumbColor: AppColors.WHITE,
                          ),
                          child: SfSlider(
                            value: distance.value,
                            onChanged: (onChanged) {
                              distance.value = (onChanged as double).toInt();
                            },
                            max: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 44),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xffEB4887),
                            Color(0xffCC3263),
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 77, right: 77),
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: AppFonts.INTER_SEMIBOLD,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 23),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
