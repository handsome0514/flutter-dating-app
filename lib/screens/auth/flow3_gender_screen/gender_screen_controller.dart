import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bematched/config.dart';
import 'package:bematched/screens/auth/flow5_birth_screen/birth_screen.dart';

import '../../../utils/base_controller.dart';
import '../../admin_base_controller.dart';

class GenderScreenController extends GetxController {
  final _baseController = BaseController(Get.context, () {});
  List<String> gender = ['Female', 'Male'];
  Rx<int> selectedGender = Rx(0);

  void setGender() {
    try {
      _baseController.showProgress();
      var userModel = AdminBaseController.userData.value;
      userModel
        ..flow = 2
        ..myGender = selectedGender.value;
      userModel.addNewUserOrUpdate();
      AdminBaseController.updateUser(userModel);
      _baseController.hideProgress();
      Get.offAll(() => BirthScreen(), transition: Transition.rightToLeft);
    } catch (e) {
      _baseController.hideProgress();
      print(e);
    }
  }
}
