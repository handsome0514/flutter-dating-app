import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bematched/config.dart';
import 'package:bematched/screens/auth/flow6_picture_screen/picture_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../utils/base_controller.dart';
import '../../admin_base_controller.dart';

class BirthScreenController extends GetxController {
  final _baseController = BaseController(Get.context, () {});
  DateTime? selectedDate;

  void setDOB() {
    if (selectedDate == null) {
      showOkAlertDialog(
          context: Get.context!,
          title: 'Error',
          message: 'Date of Birth is Required');
      return;
    }
    try {
      _baseController.showProgress();
      var userModel = AdminBaseController.userData.value;
      userModel
        ..flow = 3
        ..dob = Timestamp.fromDate(selectedDate!);
      userModel.addNewUserOrUpdate();
      AdminBaseController.updateUser(userModel);
      _baseController.hideProgress();
      Get.offAll(() => PictureScreen(), transition: Transition.rightToLeft);
    } catch (e) {
      _baseController.hideProgress();
      print(e);
    }
  }
}
