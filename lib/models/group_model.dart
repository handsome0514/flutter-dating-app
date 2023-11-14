

import 'package:bematched/utils/extension.dart';

import '../screens/admin_base_controller.dart';

class GroupModel {
  List<dynamic>? participantUserList;

  List<dynamic>? bookMarkList;
  String? groupName;
  String? id;
  bool? isGlobal;
  int? type;
  String? createdBy;
  static String TABLE_NAME = "groups";
  List<String>? participantsImages;
  List<dynamic>? mutedList;
  List<dynamic>? activeUserList;
  List<dynamic>? nonActiveUserList;
  List<dynamic>? showImagesUserList;
  bool? isPrivate;
  int? maxMembers;
  int? replySpeed;

  GroupModel();

  GroupModel.fromJson(Map<String, dynamic> json) {
    participantUserList = json['participant_user_list'] ?? [];
    groupName = json['group_name']?.toString().kcapitalizeFirstLetter() ?? "";
    id = json['id'];
    isGlobal = json['is_global'];
    type = json['type'];
    createdBy = json['created_by'];
    bookMarkList = json['bookmark_list'] ?? [];
    mutedList = json['muted_list'] ?? [];
    activeUserList = json['active_user_list'] ?? [];
    nonActiveUserList = json['non_active_user_list'] ?? [];
    showImagesUserList = json['show_images_user_list'] ?? [];
    isPrivate = json['is_private'] ?? false;
    maxMembers = json['max_members'] ?? 0;
    replySpeed = json['reply_speed'] ?? 0;
  }

  bool get isNewMessage {
    return (nonActiveUserList
                ?.contains(AdminBaseController.userData.value.uid) ??
            false) &&
        (participantUserList
                ?.contains(AdminBaseController.userData.value.uid) ??
            false);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["participant_user_list"] = participantUserList ?? [];
    data["group_name"] = groupName;
    data["id"] = id;
    data["is_global"] = isGlobal;
    data["type"] = type;
    data["created_by"] = createdBy;
    data["bookmark_list"] = bookMarkList ?? [];
    data["muted_list"] = mutedList ?? [];
    data["active_user_list"] = activeUserList ?? [];

    data["non_active_user_list"] = nonActiveUserList ?? [];
    data["show_images_user_list"] = showImagesUserList ?? [];
    data["is_private"] = isPrivate;
    data["max_members"] = maxMembers ?? 0;
    data["reply_speed"] = replySpeed ?? 0;

    return data;
  }

  bool isBookMarked() {
    return bookMarkList!.contains(AdminBaseController.userData.value.uid!);
  }
}
