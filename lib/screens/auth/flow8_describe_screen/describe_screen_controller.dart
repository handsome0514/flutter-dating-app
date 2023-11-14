






import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bematched/config.dart';
import 'package:bematched/screens/auth/flow9_lcoation_screen/location_screen.dart';
import 'package:bematched/utils/base_controller.dart';

import '../../admin_base_controller.dart';

class DescribeScreenController extends GetxController{
  final _baseController  = BaseController(Get.context,(){});

String description = '';




void setDescription(){
  if (description.isEmpty) {
    showOkAlertDialog(
        context: Get.context!,
        title: 'Error',
        message: 'Please write something about yourself');
    return;
  }
  try {
    _baseController.showProgress();
    var userModel = AdminBaseController.userData.value;
    userModel
      ..flow = 6
      ..bio = description;
    userModel.addNewUserOrUpdate();
    AdminBaseController.updateUser(userModel);
    _baseController.hideProgress();
    Get.to(() => LocationScreen());
  } catch (e) {
    _baseController.hideProgress();
    print(e);
  }





}



}