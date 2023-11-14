import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';



//*******************************************************************
class AdminBaseController
    extends GetxController //*******************************************************************
{
  var userModel = UserModel().obs;
  Rx<Position>? position;
  Map<String, UserModel> users = {};

  Rx<DocumentSnapshot>? lastDocument;

  Rx<DocumentSnapshot>? lastAdvanceFilterDocument;

  static bool isContains(String uid) {
    var userController = Get.put(AdminBaseController(), permanent: true);
    return userController.users[uid] != null;
  }

  static void addUser(UserModel userModel) {
    var userController = Get.put(AdminBaseController(), permanent: true);
    print(userModel);
    userController.users[userModel.uid!] = userModel;
  }

  static UserModel? getUser(String uid) {
    var userController = Get.put(AdminBaseController(), permanent: true);
    return userController.users[uid];
  }

  //*******************************************************************

  //*******************************************************************

  //*******************************************************************
  static void updateUser(UserModel userModel) {
    //*******************************************************************
    var userController = Get.put(AdminBaseController(), permanent: true);
    userController.userModel.value = userModel;
    userController.update();
  }

  //*******************************************************************
  static void updatePosition(Position position) {
    //*******************************************************************
    var userController = Get.put(AdminBaseController(), permanent: true);
    userController.position = position.obs;
    userController.update();
  }

  //*******************************************************************
  static void updateDocument(DocumentSnapshot? position) {
    //*******************************************************************
    var userController = Get.put(AdminBaseController(), permanent: true);
    userController.lastDocument = position?.obs;
    userController.update();
  }

  //*******************************************************************
  static void updateAdvanceFilterDocument(DocumentSnapshot? position) {
    //*******************************************************************
    var userController = Get.put(AdminBaseController(), permanent: true);
    userController.lastAdvanceFilterDocument = position?.obs;
    userController.update();
  }

  static DocumentSnapshot? get getAdvanceFilterDocument {
    return Get.put(AdminBaseController(), permanent: true)
        .lastAdvanceFilterDocument
        ?.value;
  }

  static DocumentSnapshot? get getDocument {
    return Get.put(AdminBaseController(), permanent: true).lastDocument?.value;
  }

  static Position get getPosition {
    return Get.put(AdminBaseController(), permanent: true).position!.value;
  }

  static Rx<UserModel> get userData {
    return Get.put(AdminBaseController(), permanent: true).userModel;
  }
}
