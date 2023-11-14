import 'package:bematched/screens/home_screen/bff_box.dart';
import 'package:bematched/screens/home_screen/date_box.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../widgets/date_swipe_card.dart';

class HomeScreenController extends GetxController {
  List<String> tabList = ['BFF', 'DATE', 'BIZZ'];
  Rx<int> tabIndex = Rx(0);

  MatchEngine matchEngine = MatchEngine();

  @override
  void onInit() {
    loadDumyUsers();
    // TODO: implement onInit
    super.onInit();
  }

  void loadDumyUsers() {
    List<SwipeItem> swipeItems = [];
    for (int i = 0; i < 10; i++) {
      print('i: $i');
      swipeItems.add(SwipeItem(
          content: DateSwipeCard(),
          likeAction: () {
            //   likeUser(element);
          },
          nopeAction: () {
            // disLikeUser(element);
          },
          superlikeAction: () {
            // superUser(element);
          },
          onSlideUpdate: (region) async {}));
    }

    matchEngine = MatchEngine(swipeItems: swipeItems);

    update();
  }
}
