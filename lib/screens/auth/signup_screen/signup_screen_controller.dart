import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bematched/config.dart';
import 'package:bematched/screens/auth/flow1_name_screen/name_screen.dart';
import 'package:bematched/utils/base_controller.dart';

import '../../../models/user_model.dart';
import '../../../network_service/network_services.dart';

class SignUpScreenController extends GetxController {
  String email = '';
  String password = '';
  final _baseController = BaseController(Get.context!, () {});

  //****************************************************************
  void signUp() async {
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
      ..password = password
      ..flow = 0;

    try {
      _baseController.showProgress();
      var responseUser = await NetWorkServices.signupUser(userModel);
      _baseController.hideProgress();
      Get.offAll(() =>  NameScreen());
    } on AppException catch (e) {
      _baseController.hideProgress();
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: e.error);
      return;
    }
    return;
  }
}
