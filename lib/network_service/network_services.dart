import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../models/chat_model.dart';
import '../models/group_model.dart';
import '../models/home_user_filter_model.dart';
import '../models/notification_model.dart';
import '../models/report_message_model.dart';
import '../models/thread_model.dart';
import '../models/user_model.dart';
import '../screens/admin_base_controller.dart';
import '../utils/extension.dart';

//******************************************************************************
class NetWorkServices {
  //******************************************************************************

  //******************************************************************************
  static Future<UserModel?> signupUser(UserModel userModel) async {
    //******************************************************************************

    try {
      var authUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);
      userModel.uid = authUser.user?.uid ?? "";
      AdminBaseController.updateUser(userModel);
      await userModel.addNewUserOrUpdate();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw AppException(e.message);
      return null;
    }
    return null;
  }

  //******************************************************************************
  static Future<UserModel?> loginUser(UserModel userModel) async {
    //******************************************************************************

    try {
      var authUser = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);
      userModel.uid = authUser.user?.uid ?? "";
      return await UserModel.getUserDetail(
          FirebaseAuth.instance.currentUser!.uid);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw AppException(e.message);
      return null;
    }
    return null;
  }

  //******************************************************************************
  static Future<UserModel?> getUserDetail() async {
    //******************************************************************************

    try {
      if (FirebaseAuth.instance.currentUser == null) return null;
      return await UserModel.getUserDetail(
          FirebaseAuth.instance.currentUser!.uid);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw AppException(e.message);
      return null;
    }
    return null;
  }

  //******************************************************************************
  static Future<UserModel?> getUserDetailById(String uid) async {
    //******************************************************************************

    try {
      if (FirebaseAuth.instance.currentUser == null) return null;
      return await UserModel.getUserDetail(uid);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw AppException(e.message);
      return null;
    }
    return null;
  }

  //******************************************************************************
  static Future<String> uploadUserImage(String uid, String path) async {
    //******************************************************************************

    try {
      return await uploadImage("users/$uid/profile", path);
    } on Exception catch (e) {
      throw AppException(e.toString());
    }
  }

  static Future deleteFile(String url) async {
    if ((url.isEmpty ?? true) || !url.contains("firebasestorage")) {
      return;
    }

    try {
      Reference photoRef = FirebaseStorage.instance.refFromURL(url);
      print(photoRef.fullPath);
      if (photoRef.isBlank == false) await photoRef.delete();
    } on Exception catch (e) {
      // TODO
    }
  }

  //******************************************************************************
  static Future<String> uploadImage(String uid, String path) async {
    //*****************************************************************************
    Reference reference = FirebaseStorage.instance.ref().child(uid);
    UploadTask uploadTask = reference.putFile(File(path));
    TaskSnapshot snapshot = await uploadTask;
    var url = await snapshot.ref.getDownloadURL();
    print(url);
    return url;
  }

  static Future<List<UserModel>> getHomeUsers(
      HomeFilterModel userFilter) async {
    int pageSize = 30;
    var currentUser = AdminBaseController.userData.value;

    var startDate = DateTime.now()
        .subtract(Duration(days: 365 * (userFilter.age?.start ?? 0)));
    var endDate = DateTime.now()
        .subtract(Duration(days: 365 * (userFilter.age?.end ?? 0)));
    Query<Map<String, dynamic>> snapShotQuery;

    snapShotQuery = FirebaseFirestore.instance
        .collection(UserModel.TABLE_NAME)
        .where("is_deleted", isEqualTo: false)
        .where("i_am", whereIn: userFilter.lookingFor ?? [])
        .where("is_private", isEqualTo: false);

    /*    .where("dob", isGreaterThanOrEqualTo: Timestamp.fromDate(endDate))
          .where("dob", isLessThanOrEqualTo: Timestamp.fromDate(startDate))
          .orderBy("dob");

      */
    if (startDate.year > 1970 && endDate.year > 1970) {
      print(
          "if 1 ${endDate.year} ${startDate.year}");

      snapShotQuery = snapShotQuery
          .where("dob", isGreaterThanOrEqualTo: Timestamp.fromDate(endDate))
          .where("dob", isLessThanOrEqualTo: Timestamp.fromDate(startDate))
          .orderBy("dob");
    } else if (endDate.year < 1970 && startDate.year < 1970) {
      print(
          "if 2 ${endDate.year} ${startDate.year}");

      snapShotQuery = snapShotQuery
          .where("dob", isLessThanOrEqualTo: DateTime(1970))
          // .where("dob", isGreaterThanOrEqualTo: Timestamp.fromDate(endDate))
          .orderBy("dob");
    } else {
      print(
          "if 3 ${endDate.year} ${startDate.year}");

      snapShotQuery = snapShotQuery
          .where("dob", isLessThanOrEqualTo: Timestamp.fromDate(startDate))
          .orderBy("dob");
    }

    if (AdminBaseController.getDocument != null) {
      print(AdminBaseController.getDocument!.id);
      snapShotQuery =
          snapShotQuery.startAfterDocument(AdminBaseController.getDocument!);
    }
    var snapShot = await snapShotQuery.limit(pageSize).get();
    var myId = AdminBaseController.userData.value.uid;
    var points = AdminBaseController.getPosition;
    /* GeoFirePoint center =
        geo.point(latitude: points.latitude, longitude: points.longitude);
    print("started");
    Stream<List<DocumentSnapshot>> stream = geo
        .collection(collectionRef: snapShotQuery.limit(10))
        .within(
            center: center,
            radius: userFilter.distance!.toDouble(),
            field: field);
    print("endded");

    stream.listen((List<DocumentSnapshot> documentList) {
      print(documentList.map((e) => e.data()));
    });*/
    //print("object_length=> " + snapShot.docs.length.toString());

    var filterItem = snapShot.docs
        .map((e) {
          AdminBaseController.updateDocument(e);
          return UserModel.fromJson(e.data());
        })
        .where((element) =>
            element.age > userFilter.age!.start! &&
            element.age <= userFilter.age!.end!)
        .where((element) => element.uid != myId)
        .where((element) {
          /*print(element.distance.toString() +
              "<" +
              userFilter.distance.toString());
          */
          return element.distance < userFilter.distance!;
        })
        .where((element) =>
            !currentUser.isLiked(element.uid!) &&
            !currentUser.isDisLiked(element.uid!))
        .where((element) =>
            userFilter.interestedIn?.contains(element.myGender) ?? false)
        .toList();

    if (filterItem.isEmpty && snapShot.docs.length == pageSize) {
      return await getHomeUsers(userFilter);
    }

    return filterItem;
    return [];
  }


  //******************************************************************************
  static Future<void> sendPasswordResetEmail(String email) async {
    //******************************************************************************
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AppException(e.message);
    }
  }

/*  static Future<void> likeUser(UserModel liker, UserModel likee) async {
    var isMatch = *//*likee.isSuperLiked(liker.uid!) ||*//* likee
        .isLiked(liker.uid!);

    await FirebaseFirestore.instance
        .collection(UserModel.TABLE_NAME)
        .doc(liker.uid)
        .update({
      "my_likes": FieldValue.arrayUnion([likee.uid]),
      "likes": FieldValue.increment(
          liker.memberShipType == UserModel.MEMBER_PREMIUM_NON ? -1 : 0),
      if (isMatch) "matches": FieldValue.arrayUnion([likee.uid]),
    });
    await FirebaseFirestore.instance
        .collection(UserModel.TABLE_NAME)
        .doc(likee.uid)
        .update({
      "other_likes": FieldValue.arrayUnion([liker.uid]),
      if (isMatch) "matches": FieldValue.arrayUnion([liker.uid]),
    });
    if (isMatch) {
      await createNewThread(liker, likee, null);
      await sendMatchNotification(liker, likee);
    }
  }*/

  static Future<void> createNewThread(
      UserModel liker, UserModel likee, String? message) async {
    var threadId = createThreadId(likee.uid!, liker.uid!);
    var snapShot = await FirebaseFirestore.instance
        .collection(ThreadModel.TABLE_NAME)
        .doc(threadId)
        .get();
    print("checking thread $threadId");
    if (snapShot.exists) return;
    print("created new thread");

    var thread = ThreadModel()
      ..threadId = threadId
      ..lastMessage = message
      ..lastMessageTime = Timestamp.now()
      ..senderId = liker.uid ?? ""
      ..showImagesUserList = [liker.uid ?? "", likee.uid ?? ""]
      ..participantUserList = [liker.uid ?? "", likee.uid ?? ""]
      ..messageCount = 1;
    await FirebaseFirestore.instance
        .collection(ThreadModel.TABLE_NAME)
        .doc(threadId)
        .set({...thread.toJson(), "is_pending": message == null ? false : true},
            SetOptions(merge: true));
    if (message == null) {
      return;
    }
    ChatModel chatModel = ChatModel()
      ..id = generateRandomString(10)
      ..senderId = liker.uid ?? ""
      ..message = thread.lastMessage
      ..messageTime = Timestamp.now();
    await FirebaseFirestore.instance
        .collection(ThreadModel.TABLE_NAME)
        .doc(threadId)
        .collection(ThreadModel.TABLE_NAME)
        .doc(chatModel.id)
        .set(chatModel.toJson(), SetOptions(merge: true));
  }

  static Future<void> disLikeUser(UserModel liker, UserModel likee) async {
    await FirebaseFirestore.instance
        .collection(UserModel.TABLE_NAME)
        .doc(liker.uid)
        .update({
      "my_likes": FieldValue.arrayRemove([likee.uid]),
      "my_super_likes": FieldValue.arrayRemove([likee.uid]),
      "matches": FieldValue.arrayRemove([likee.uid]),
      "other_likes": FieldValue.arrayRemove([likee.uid]),
      "other_super_likes": FieldValue.arrayRemove([likee.uid])
    });
    await FirebaseFirestore.instance
        .collection(UserModel.TABLE_NAME)
        .doc(likee.uid)
        .update({
      "other_likes": FieldValue.arrayRemove([liker.uid]),
      "other_super_likes": FieldValue.arrayRemove([liker.uid]),
      "matches": FieldValue.arrayRemove([liker.uid]),
      "my_likes": FieldValue.arrayRemove([liker.uid]),
      "my_super_likes": FieldValue.arrayRemove([liker.uid])
    });
  }


  static Future<void> sendMatchNotification(
      UserModel liker, UserModel likee) async {
    var notification = NotificationModel()
      ..id = generateRandomString(15)
      ..title = 'New Match'
      ..body = "You got a Match with ${liker.name}"
      ..receiverIds = [likee.uid!]
      ..senderId = liker.uid
      ..timestamp = Timestamp.now();
    print(notification.toJson());
    await FirebaseFirestore.instance
        .collection(NotificationModel.TABLE_NAME)
        .doc(notification.id)
        .set(notification.toJson(), SetOptions(merge: true));
    await showOkAlertDialog(
        context: Get.context!,
        title: 'Congrats',
        message: "You got a match with ${likee.name}");
  }


  static Future<List<UserModel>> getOtherLikes(UserModel userData) async {
    var snapShot = await FirebaseFirestore.instance
        .collection(UserModel.TABLE_NAME)
        .where("my_likes", arrayContains: userData.uid)
        .get();
    print(snapShot.docs);
    return snapShot.docs.map((e) => UserModel.fromJson(e.data())).toList();
  }

  static Future<List<UserModel>> getOtherSuperLikes(UserModel userData) async {
    var snapShot = await FirebaseFirestore.instance
        .collection(UserModel.TABLE_NAME)
        .where("my_likes", arrayContains: userData.uid)
        .get();
    print(snapShot.docs);
    return snapShot.docs.map((e) => UserModel.fromJson(e.data())).toList();
  }

  static Future<List<UserModel>> loadMataches(UserModel userModel) async {
    var snapShot = await FirebaseFirestore.instance
        .collection(UserModel.TABLE_NAME)
        .where("matches", arrayContains: userModel.uid)
        .get();
    return snapShot.docs.map((e) => UserModel.fromJson(e.data())).toList();
  }

  static Future<void> joinGroup(String uid, String groupId) async {
    await FirebaseFirestore.instance
        .collection(GroupModel.TABLE_NAME)
        .doc(groupId)
        .set({
      "participant_user_list": FieldValue.arrayUnion([uid]),
      "show_images_user_list": FieldValue.arrayUnion([uid])
    }, SetOptions(merge: true));
  }

  static Future<void> createGroup(
      GroupModel groupModel, NotificationModel notificationModel) async {
    await FirebaseFirestore.instance
        .collection(GroupModel.TABLE_NAME)
        .doc(groupModel.id)
        .set(groupModel.toJson(), SetOptions(merge: true));
    await FirebaseFirestore.instance
        .collection(NotificationModel.TABLE_NAME)
        .doc(notificationModel.id)
        .set(notificationModel.toJson(), SetOptions(merge: true));
  }

/*  static Future<void> toogleBookMar(
      bool isContains, GroupModel? groupModel) async {
    var uid = AdminBaseController.userData.value.uid;
    Get.snackbar(AppLanguages.FAVORITES_GROUPS,
        "You marked this group as ${!isContains ? "favourite" : "Un favourite"}",
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.PINK_Dark);
    await FirebaseFirestore.instance
        .collection(GroupModel.TABLE_NAME)
        .doc(groupModel!.id!)
        .set({
      "bookmark_list": !isContains
          ? FieldValue.arrayUnion([uid])
          : FieldValue.arrayRemove([uid])
    }, SetOptions(merge: true));
  }*/

  static Future<List<GroupModel>> getAllGroups() async {
    var uid = AdminBaseController.userData.value.uid;
    var snapShot = await FirebaseFirestore.instance
        .collection(GroupModel.TABLE_NAME)
        .where("is_global", isEqualTo: false)
        .where("created_by", isNotEqualTo: uid)
        .where("is_private", isEqualTo: false)
        .get();
    return snapShot.docs.map((e) => GroupModel.fromJson(e.data())).toList();
  }

/*  static Future<int> showGroupOptions(GroupModel groupModel) async {
    var uid = AdminBaseController.userData.value.uid;
    var result = await showConfirmationDialog(
        title: AppLanguages.GROUP_SETTINGS,
        message: AppLanguages.PLEASE_SELECT_VALUE,
        actions: [
          AlertDialogAction(
              key: "1",
              label: groupModel.mutedList!.contains(uid)
                  ? AppLanguages.UN_MUTE_GROUP
                  : AppLanguages.MUTE_GROUP),
          AlertDialogAction(
              key: "2",
              label: groupModel.createdBy == uid
                  ? AppLanguages.DELETE_GROUP
                  : AppLanguages.EXIT_GROUP),
          AlertDialogAction(
              key: "3",
              label: !groupModel.showImagesUserList!.contains(uid)
                  ? AppLanguages.UN_MUTE_IMAGE
                  : AppLanguages.MUTE_IMAGE),
        ],
        context: Get.context!);
    if (result == null) return -1;
    if (result == "1") {
      await muteUnMuteGroup(
          groupModel.id!, groupModel.mutedList!.contains(uid), uid!);
      return 0;
    } else if (result == "2") {
      if (groupModel.createdBy == uid) {
        var result = await showOkCancelAlertDialog(
            context: Get.context!,
            title: AppLanguages.DELETE_GROUP,
            message: AppLanguages.DO_YOU_REALLY_WANT_DELETE);
        if (result == OkCancelResult.ok) {
          await deleteGroup(groupModel.id!);
          return 1;
        }
        return -1;
      }

      var result = await showOkCancelAlertDialog(
          context: Get.context!,
          title: AppLanguages.EXIT_GROUP,
          message: AppLanguages.DO_YOU_REALLY_WANT_TO_LEAVE);
      if (result == OkCancelResult.ok) {
        await leaveGroup(groupModel.id!, uid!);
        return 1;
      }
      return -1;
    } else {
      await muteUnMuteImagesGroup(
          groupModel.id!, groupModel.showImagesUserList!.contains(uid), uid!);
      print("going");
      return 2;
    }
    return -1;
    print(result);
  }*/

  static Future<void> muteUnMuteGroup(
      String groupId, bool isMute, String uid) async {
    await FirebaseFirestore.instance
        .collection(GroupModel.TABLE_NAME)
        .doc(groupId)
        .set({
      "muted_list":
          isMute ? FieldValue.arrayRemove([uid]) : FieldValue.arrayUnion([uid])
    }, SetOptions(merge: true));
  }

  static Future<void> muteUnMuteImagesGroup(
      String groupId, bool isMute, String uid) async {
    await FirebaseFirestore.instance
        .collection(GroupModel.TABLE_NAME)
        .doc(groupId)
        .set({
      "show_images_user_list":
          isMute ? FieldValue.arrayRemove([uid]) : FieldValue.arrayUnion([uid])
    }, SetOptions(merge: true));
  }

  static Future<void> muteUnMuteImagesThread(
      String threadId, bool isMute, String uid) async {
    await FirebaseFirestore.instance
        .collection(ThreadModel.TABLE_NAME)
        .doc(threadId)
        .set({
      "show_images_user_list":
          isMute ? FieldValue.arrayRemove([uid]) : FieldValue.arrayUnion([uid])
    }, SetOptions(merge: true));
  }

  static Future<void> muteUnMuteChat(
      String threadId, bool isMute, String uid) async {
    await FirebaseFirestore.instance
        .collection(ThreadModel.TABLE_NAME)
        .doc(threadId)
        .set({
      "muted_list":
          isMute ? FieldValue.arrayRemove([uid]) : FieldValue.arrayUnion([uid])
    }, SetOptions(merge: true));
  }

  static Future<void> deleteGroup(String groupId) async {
    await FirebaseFirestore.instance
        .collection(GroupModel.TABLE_NAME)
        .doc(groupId)
        .delete();
  }

  static Future<void> leaveGroup(String groupId, String uid) async {
    await FirebaseFirestore.instance
        .collection(GroupModel.TABLE_NAME)
        .doc(groupId)
        .set({
      "participant_user_list": FieldValue.arrayRemove([uid])
    }, SetOptions(merge: true));
  }

  static Future<void> enterLeaveGroup(
      bool isEnter, GroupModel groupModel) async {
    var uid = AdminBaseController.userData.value.uid;
    await FirebaseFirestore.instance
        .collection(GroupModel.TABLE_NAME)
        .doc(groupModel.id)
        .set({
      "active_user_list": isEnter
          ? FieldValue.arrayUnion([uid])
          : FieldValue.arrayRemove([uid]),
      "non_active_user_list": FieldValue.arrayRemove([uid])
    }, SetOptions(merge: true));
  }

  static Future<void> sendMesageInGroup(
      GroupModel groupModel, bool isImage) async {
    print(groupModel.activeUserList!);
    await FirebaseFirestore.instance
        .collection(GroupModel.TABLE_NAME)
        .doc(groupModel.id)
        .set({
      "non_active_user_list": FieldValue.arrayUnion([
        ...groupModel.participantUserList!
            .where((element) =>
                !groupModel.activeUserList!.contains(element.toString()))
            .where((element) =>
                !isImage ||
                groupModel.activeUserList!.contains(element.toString()))
            .toList()
      ])
    }, SetOptions(merge: true));
  }

  static updatePrivacy(GroupModel groupModel, bool isPrivate) async {
    await FirebaseFirestore.instance
        .collection(GroupModel.TABLE_NAME)
        .doc(groupModel.id)
        .set({"is_private": isPrivate}, SetOptions(merge: true));
  }

  static Future<GroupModel> loadGroupDetail(String? id) async {
    var snapShot = await FirebaseFirestore.instance
        .collection(GroupModel.TABLE_NAME)
        .doc(id)
        .get();
    return GroupModel.fromJson(snapShot.data() ?? {});
  }

  static Future<void> acceptChat(String? threadId) async {
    await FirebaseFirestore.instance
        .collection(ThreadModel.TABLE_NAME)
        .doc(threadId!)
        .set({"is_pending": false}, SetOptions(merge: true));
  }

  static Future<void> blockUser(
      UserModel receiverDetail, ThreadModel threadModel) async {
    var uid = AdminBaseController.userData.value.uid;
    await FirebaseFirestore.instance
        .collection(ThreadModel.TABLE_NAME)
        .doc(threadModel.threadId!)
        .set({
      "is_blocked": true,
      "sender_id": uid,
      "last_message": 'Block',
      "last_message_time": Timestamp.now()
    }, SetOptions(merge: true));
  }

  static Future<void> UnblockUser(
      UserModel receiverDetail, ThreadModel threadModel) async {
    var uid = AdminBaseController.userData.value.uid;
    await FirebaseFirestore.instance
        .collection(ThreadModel.TABLE_NAME)
        .doc(threadModel.threadId!)
        .set({
      "is_blocked": false,
      "sender_id": uid,
      "last_message": 'Unblock',
      "last_message_time": Timestamp.now()
    }, SetOptions(merge: true));
  }

  static Future<void> deleteConversation(
      ThreadModel threadModel, String threadId, String receiver_id) async {
    var uid = AdminBaseController.userData.value.uid;
/*    await FirebaseFirestore.instance
        .collection(ThreadModel.TABLE_NAME)
        .doc(threadId)
        .delete();*/

    final instance = FirebaseFirestore.instance;
    final batch = instance.batch();
    var collection = instance
        .collection(ThreadModel.TABLE_NAME)
        .doc(threadId)
        .collection(ThreadModel.TABLE_NAME);
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
    await FirebaseFirestore.instance
        .collection(ThreadModel.TABLE_NAME)
        .doc(threadId)
        .delete();
    await FirebaseFirestore.instance
        .collection(UserModel.TABLE_NAME)
        .doc(uid)
        .set({
      "my_likes": FieldValue.arrayRemove([receiver_id]),
      "my_super_likes": FieldValue.arrayRemove([receiver_id]),
      "my_dislikes": FieldValue.arrayRemove([receiver_id]),
      "other_likes": FieldValue.arrayRemove([receiver_id]),
      "other_super_likes": FieldValue.arrayRemove([receiver_id]),
      "other_dislikes": FieldValue.arrayRemove([receiver_id])
    }, SetOptions(merge: true));
    await FirebaseFirestore.instance
        .collection(UserModel.TABLE_NAME)
        .doc(receiver_id)
        .set({
      "my_likes": FieldValue.arrayRemove([uid]),
      "my_super_likes": FieldValue.arrayRemove([uid]),
      "my_dislikes": FieldValue.arrayRemove([uid]),
      "other_likes": FieldValue.arrayRemove([uid]),
      "other_super_likes": FieldValue.arrayRemove([uid]),
      "other_dislikes": FieldValue.arrayRemove([uid])
    }, SetOptions(merge: true));

    /*
        .set({
      "is_blocked": threadModel.isBlocked,
      "is_pending": threadModel.isPending,
      "sender_id": uid,
      "participant_user_list": FieldValue.arrayUnion([uid, receiver_id]),
      "thread_id": threadId,
      "last_message": AppLanguages.CONVERSATION_DELETED,
      "last_message_time": Timestamp.now(),
      "message_count": 1,
    }, SetOptions(merge: true));*/
  }


  static Future<void> purchaseStar(int count, String uid) async {
    await FirebaseFirestore.instance
        .collection(UserModel.TABLE_NAME)
        .doc(uid)
        .set({"total_stars": FieldValue.increment(count)},
            SetOptions(merge: true));
  }

  static Future<void> updateAccountPrivacy(String uid, bool status) async {
    await FirebaseFirestore.instance
        .collection(UserModel.TABLE_NAME)
        .doc(uid)
        .update({
      "is_private": status,
    });
  }


  static Future<GroupModel> getGroupDetail(String groupId) async {
    var snapShot = await FirebaseFirestore.instance
        .collection(GroupModel.TABLE_NAME)
        .doc(groupId)
        .get();
    return GroupModel.fromJson(snapShot.data() ?? {});
  }

/*  static Future<String?> changePassword() async {
    var inputs = await showTextInputDialog(
        context: Get.context!,
        title: AppLanguages.CHANGE_PASSWORD,
        textFields: [
          DialogTextField(
              hintText: AppLanguages.OLD_PASSWORD,
              obscureText: true,
              validator: (password) {
                if (password?.isEmpty ?? true) {
                  return AppLanguages.PASSWORD_IS_REQUIRED;
                }
                if (password!.length < 8) {
                  return AppLanguages.PASSWORD_LENGTH_REQUIRED;
                }
              }),
          DialogTextField(
              obscureText: true,
              hintText: AppLanguages.NEW_PASSWORD,
              validator: (password) {
                if (password?.isEmpty ?? true) {
                  return AppLanguages.PASSWORD_IS_REQUIRED;
                }
                if (password!.length < 8) {
                  return AppLanguages.PASSWORD_LENGTH_REQUIRED;
                }
              })
        ]);
    print(inputs);

    if (inputs == null ||
        inputs.isEmpty ||
        inputs[0].isEmpty ||
        inputs[1].isEmpty) return "";
    try {
      var email = AdminBaseController.userData.value.email!;
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: inputs[0]);

      await FirebaseAuth.instance.currentUser!.updatePassword(inputs[1]);
      await showOkAlertDialog(
          context: Get.context!,
          title: "Update Password",
          message: "Password updated");
      return null;
    } on Exception catch (e) {
      return e.toString();
    }
  }*/

/*  static Future<String?> deleteAccount() async {
    var userDetail = AdminBaseController.userData.value;

    try {
      HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
        'deleteUser',
        options: HttpsCallableOptions(
          timeout: const Duration(seconds: 5),
        ),
      );
      final result = await callable.call(<String, dynamic>{
        'uid': userDetail.uid ?? "",
      });
      print(result.data.toString());
      if (result.data.toString().contains("error")) {
        return "Error";
      }
    } on Exception catch (e) {
      print(e);
      return e.toString();
    }

    await NotificationUtils.fcmUnSubscribe();

    var userID = userDetail.uid;
    await deleteFile(userDetail.profileImage ?? "");
    for (var image in userDetail.images ?? []) {
      await deleteFile(image.toString());
    }

    await FirebaseFirestore.instance
        .collection(UserModel.TABLE_NAME)
        .doc(userID)
        .set({
      "is_deleted": true,
      "first_name": "User",
      "last_name": "Deleted",
      "deleted_on": Timestamp.now(),
      "images": [],
      "my_likes": [],
      "profile_image":
          "https://firebasestorage.googleapis.com/v0/b/ever-love.appspot.com/o/574748-200.png?alt=media&token=a64e586f-37be-493c-a042-681f9b8f5364",
      "my_dislikes": [],
      "my_super_likes": []
    }, SetOptions(merge: true));
    await FirebaseAuth.instance.signOut();

    return null;
  }*/

  static Future<void> reportUserMessaagesORGroup(
      String messageId, int reportType, String message, String filePath) async {
    print(messageId);
    ReportMessageModel reportMessageModel = ReportMessageModel()
      ..id = messageId.replaceAll("/", "__")
      // ..sender_id = AdminBaseController.userData.value.uid
      ..type = reportType
      // ..reported_userid = chatModel.senderId
      ..report_time = Timestamp.now()
      // ..messages = message
      ..filePath = filePath
      ..message_id = messageId;
    await FirebaseFirestore.instance
        .collection(ReportMessageModel.TABLE_NAME)
        .doc((reportMessageModel.id ?? "").replaceAll("/", "__"))
        .set({
      ...reportMessageModel.toMap(),
      /* "sender_id":
          FieldValue.arrayUnion([AdminBaseController.userData.value.uid]),
      "reported_userid":
          FieldValue.arrayUnion([AdminBaseController.userData.value.email]),*/
      "messages": FieldValue.arrayUnion([
        "${AdminBaseController.userData.value?.uid ?? ""}-***-$message-***-${AdminBaseController.userData.value?.email ?? ""}"
      ])
    }, SetOptions(merge: true));
  }

  static Future<void> reportUser(UserModel userModel) async {
    var option1 = "Fake profile";
    var option2 = "Selling/scamming content";
    var option3 = "Nudity/sexual content";
    var option4 = "Abusive/Threatening content";
    var option5 = "Suspect under aged (18)";
    var options = await showConfirmationDialog(
        context: Get.context!,
        title: "Please select option",
        actions: [
          AlertDialogAction(label: option1, key: option1),
          AlertDialogAction(label: option2, key: option2),
          AlertDialogAction(label: option3, key: option3),
          AlertDialogAction(label: option4, key: option4),
          AlertDialogAction(label: option5, key: option5),
        ]);
    if (options == null) return;

    /* var texts = await showTextInputDialog(
        title: AppLanguages.REPORT_USER,
        context: Get.context!,
        textFields: [
          DialogTextField(
              initialText: AppLanguages.REPORT_USER_MESSAGE +
                  " " +
                  (userModel?.email ?? "") +
                  "\n",
              maxLines: 5,
              validator: (data) {
                if (data?.isEmpty ?? true) {
                  AppLanguages.REQUIRED;
                }
                return null;
              })
        ]);
*/
    print(options);
    /*if (texts == null || texts[0] == null) return;
    */
    options = "${userModel.email ?? ""}\n${options}";
    var messageId = "${UserModel.TABLE_NAME}/${userModel.uid ?? ""}";
    NetWorkServices.reportUserMessaagesORGroup(
        messageId, ReportMessageModel.USER_REPORT, options, "");
    showOkAlertDialog(
        context: Get.context!,
        title: 'Report User',
        message: 'User has been Reported successfully');
  }
}

//******************************************************************************
class AppException implements Exception {
  //******************************************************************************

  String? error;

  AppException(this.error);
}

enum NavigationType {
  NAME_FLOW,
  GENDER_FLOW,
  BIRTH_FLOW,
  PICTURE_FLOW,
  INTEREST_FLOW,
  DESCRIBE_FLOW,
  LOCATION_FLOW,
  SWIPE,
}
