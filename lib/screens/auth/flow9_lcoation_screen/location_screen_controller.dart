import 'package:bematched/config.dart';
import 'package:bematched/screens/navbar_screen/navbar_screen.dart';
import 'package:bematched/utils/base_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:location/location.dart';

import '../../admin_base_controller.dart';

class LocationScreenController extends GetxController {
  final _baseController = BaseController(Get.context, () {});
  LocationData? currentLocation;
  Rx<bool> isLoading = Rx(false);
  Rx<bool> isNotPermision = Rx(false);

  void setLocation() {
    try {
      _baseController.showProgress();
      var userModel = AdminBaseController.userData.value;
      userModel
        ..flow = 7
        ..longitude = currentLocation?.longitude
        ..latitude = currentLocation?.latitude;
      userModel.addNewUserOrUpdate();
      AdminBaseController.updateUser(userModel);
      _baseController.hideProgress();
      Get.offAll(() => NavBarScreen());
    } catch (e) {
      _baseController.hideProgress();
      print(e);
    }
  }

  @override
  void onInit() async {
    try {
      isLoading.value = true;
      currentLocation = await Location.instance.getLocation();
      isLoading.value = false;
    } catch (e) {
      if (kDebugMode) {
        isLoading.value = false;
        isNotPermision.value = true;
        print(e);
      }
    }

    // TODO: implement onInit
    super.onInit();
  }
}
