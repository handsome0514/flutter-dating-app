import 'package:bematched/config.dart';
import 'package:bematched/models/user_model.dart';
import 'package:bematched/screens/admin_base_controller.dart';
import 'package:bematched/utils/constants.dart';

class NavBarScreenController extends GetxController {

  Rx<int> selectedIndex = Rx(0);
  var UserModel = AdminBaseController.userData.value;


  List<String> navbarList = [
    SvgAssets.HOME_ICON,
    SvgAssets.HEART_ICON,
    SvgAssets.ADD_ICON,
    SvgAssets.CHAT_ICON,
    SvgAssets.PROFILE_ICON
  ];
}
