import 'package:bematched/screens/home_screen/home_screen_controller.dart';
import 'package:bematched/screens/profile_screen/profile_screen.dart';
import 'package:bematched/widgets/date_swipe_card.dart';
import 'package:bematched/widgets/filter_bottomsheet.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../config.dart';
import '../../utils/constants.dart';

class DateBox extends StatelessWidget {
  DateBox({super.key});

  final _controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Get.bottomSheet(
                FilterBottomSheet(),
                isScrollControlled: true,
                persistent: false,
                enableDrag: true,
              );
            },
            child: Container(
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border.all(color: const Color(0xffE8E6EA)),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.only(
                    top: 14, bottom: 14, left: 14, right: 13),
                child: SvgPicture.asset(SvgAssets.FILTER_ICON)),
          ),
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: 523,
          child: CardSwiper(
            padding: const EdgeInsets.only(left: 8,right: 30),
            numberOfCardsDisplayed: 3,
            cardsCount:5,
            backCardOffset: const Offset(30, 0),
            cardBuilder: (context, index, percentThresholdX, percentThresholdY) => const DateSwipeCard(),
          ),
        ),
      ],
    );
  }
}
