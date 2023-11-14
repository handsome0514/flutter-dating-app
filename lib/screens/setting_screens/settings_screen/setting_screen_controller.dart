import 'package:bematched/config.dart';
import 'package:bematched/screens/welcome_screen/welcome_screen.dart';
import 'package:get/get.dart';

class SettingScreenController extends GetxController {
  Rx<bool> isIncognito = Rx(false);
  Rx<bool> isNewMessage = Rx(false);
  Rx<bool> isNewMatch = Rx(false);
  Rx<bool> getNofifiedinApp = Rx(false);
  Rx<bool> getNotifiedinGmail = Rx(false);

  void signOut() {
    FirebaseAuth.instance
        .signOut()
        .then((value) => Get.offAll(() => WelcomeScreen()));
  }
}
