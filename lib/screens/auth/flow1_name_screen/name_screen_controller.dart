import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bematched/config.dart';
import 'package:bematched/screens/admin_base_controller.dart';
import 'package:bematched/screens/auth/flow3_gender_screen/gender_screen.dart';
import 'package:bematched/utils/base_controller.dart';

class NameScreenController extends GetxController {
  final _baseController = BaseController(Get.context, () {});
  String name = '';

  void setName() {
    if (name.isEmpty) {
      showOkAlertDialog(
          context: Get.context!, title: 'Error', message: 'Name is Required');
      return;
    }
    try {
      _baseController.showProgress();
      var userModel = AdminBaseController.userData.value;
      userModel
        ..flow = 1
        ..name = name;
      userModel.addNewUserOrUpdate();
      AdminBaseController.updateUser(userModel);
      _baseController.hideProgress();
      Get.offAll(() => GenderScreen());
    } catch (e) {
      _baseController.hideProgress();
      print(e);
    }
  }
}
