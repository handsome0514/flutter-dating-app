import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bematched/config.dart';
import 'package:bematched/screens/welcome_screen/welcome_screen.dart';

import '../../network_service/network_services.dart';
import '../../utils/data_cache.dart';
import '../admin_base_controller.dart';
import '../auth/flow1_name_screen/name_screen.dart';
import '../auth/flow3_gender_screen/gender_screen.dart';
import '../auth/flow5_birth_screen/birth_screen.dart';
import '../auth/flow6_picture_screen/picture_screen.dart';
import '../auth/flow7_interest_screen/interest_screen.dart';
import '../auth/flow8_describe_screen/describe_screen.dart';
import '../auth/flow9_lcoation_screen/location_screen.dart';
import '../navbar_screen/navbar_screen.dart';

class SplashScreenController extends GetxController {
  //*******************************************************************
  void initData() async {
    //*******************************************************************
    await DataCache.init();

    if (await NetWorkServices.getUserDetail() != null) {
      var user = AdminBaseController.userData.value;
      navigateToScreen(user.flow ?? 0);
    } else {
      Get.offAll(() => WelcomeScreen());
    }
  }

  //****************************************************************
  void navigateToScreen(int flow) async {
    //****************************************************************

    switch (NavigationType.values[flow]) {
      case NavigationType.NAME_FLOW:
        Get.offAll(() => NameScreen());
        break;
      case NavigationType.GENDER_FLOW:
        Get.offAll(() => GenderScreen());
        break;
      case NavigationType.BIRTH_FLOW:
        Get.offAll(() => BirthScreen());
        break;
      case NavigationType.PICTURE_FLOW:
        Get.offAll(() => PictureScreen());
        break;
      case NavigationType.INTEREST_FLOW:
        Get.offAll(() => InterestScreen());
        break;
      case NavigationType.DESCRIBE_FLOW:
        Get.offAll(() => DescribeScreen());
        break;
      case NavigationType.LOCATION_FLOW:
        Get.offAll(() => LocationScreen());
        break;
      case NavigationType.SWIPE:
        Get.offAll(() => NavBarScreen());
        break;
      default:
        {
          if (AdminBaseController.userData.value.isBlocked ?? false) {
            showOkAlertDialog(
                context: Get.context!,
                title: 'Error',
                message: 'Your Account is Blocked by Admin');

            return;
          }
          /*  if ((!await Permission.location.isGranted) ||
              (!await Permission.locationWhenInUse.serviceStatus.isEnabled)) {
            Get.offAll(LocationPermissionScreen());
            return;
          }*/

          Get.offAll(NavBarScreen());
        }
    }
  }

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      initData();
    });
    super.onInit();
  }
}
