import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bematched/config.dart';
import 'package:bematched/screens/auth/flow1_name_screen/name_screen.dart';
import 'package:bematched/screens/auth/flow3_gender_screen/gender_screen.dart';
import 'package:bematched/screens/auth/flow5_birth_screen/birth_screen.dart';
import 'package:bematched/screens/auth/flow6_picture_screen/picture_screen.dart';
import 'package:bematched/screens/auth/flow7_interest_screen/interest_screen.dart';
import 'package:bematched/screens/auth/flow8_describe_screen/describe_screen.dart';
import 'package:bematched/screens/auth/flow9_lcoation_screen/location_screen.dart';
import 'package:bematched/screens/navbar_screen/navbar_screen.dart';
import 'package:bematched/utils/base_controller.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../models/home_user_filter_model.dart';
import '../../../models/user_model.dart';
import '../../../network_service/network_services.dart';
import '../../admin_base_controller.dart';

class LoginScreenController extends GetxController {
  final _baseController = BaseController(Get.context!, () {});
  String email = '';
  String password = '';

  //****************************************************************
  void loginIntoTheApp() async {
    //****************************************************************
    if (email.isEmpty) {
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: 'Email is Required');
      return;
    }
    if (password.isEmpty) {
      showOkAlertDialog(
          context: Get.context!,
          title: 'Error',
          message: 'Password is Required');
      return;
    }
    if (password.length < 8) {
      showOkAlertDialog(
          context: Get.context!,
          title: 'Error',
          message: 'Password should be greater than 8 characters');
      return;
    }

    UserModel userModel = UserModel()
      ..email = email
      ..password = password;

    _baseController.showProgress();
    try {
      var userDetail = await NetWorkServices.loginUser(userModel);
      _baseController.hideProgress();
      HomeFilterModel.initFilter();
      if (userDetail == null) return;
      navigateToScreen(userDetail.flow ?? 0);
    } on AppException catch (e) {
      _baseController.hideProgress();
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: e.error);
    }
  }

  //****************************************************************
  void navigateToScreen(int flow) async {
    //****************************************************************

    switch (NavigationType.values[flow]) {
      case NavigationType.NAME_FLOW:
        Get.offAll(NameScreen());
        break;
      case NavigationType.GENDER_FLOW:
        Get.offAll(GenderScreen());
        break;
      case NavigationType.BIRTH_FLOW:
        Get.offAll(BirthScreen());
        break;
      case NavigationType.PICTURE_FLOW:
        Get.offAll(PictureScreen());
        break;
      case NavigationType.INTEREST_FLOW:
        Get.offAll(InterestScreen());
        break;
      case NavigationType.DESCRIBE_FLOW:
        Get.offAll(DescribeScreen());
        break;
      case NavigationType.LOCATION_FLOW:
        Get.offAll(LocationScreen());
        break;
      case NavigationType.SWIPE:
        Get.offAll(NavBarScreen());
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
}
