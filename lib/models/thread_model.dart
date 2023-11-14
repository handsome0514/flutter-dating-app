import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_model.dart';

class ThreadModel {
  String? lastMessage;
  Timestamp? lastMessageTime;
  List<dynamic>? participantUserList;
  List<dynamic>? activeUserLIst;
  String? senderId;
  String? threadId;
  UserModel? userDetail;
  int? messageCount;
  String? fileUrl;
  bool? isPending;
  bool? isBlocked;
  List<dynamic>? mutedList;
  List<dynamic>? showImagesUserList;

  static String TABLE_NAME = "threads";

  ThreadModel();

  ThreadModel.fromJson(Map<String, dynamic> json) {
    lastMessage = json['last_message'];
    lastMessageTime = json['last_message_time'];
    participantUserList = json['participant_user_list'];
    activeUserLIst = json['active_user_list'];
    senderId = json['sender_id'];
    threadId = json['thread_id'];
    messageCount = json['message_count'];
    fileUrl = json['file_url'];
    isPending = json['is_pending'] ?? false;
    isBlocked = json['is_blocked'] ?? false;
    mutedList = json['muted_list'] ?? [];
    showImagesUserList = json['show_images_user_list'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lastMessage != null) data['last_message'] = lastMessage;
    if (lastMessageTime != null) data['last_message_time'] = lastMessageTime;
    if (participantUserList != null) {
      data['participant_user_list'] = participantUserList;
    }
    if (activeUserLIst != null) data['active_user_list'] = activeUserLIst;
    if (senderId != null) data['sender_id'] = senderId;
    if (threadId != null) data['thread_id'] = threadId;
    if (messageCount != null) data['message_count'] = messageCount;
    if (fileUrl != null) data['file_url'] = fileUrl;
    data['is_pending'] = isPending ?? false;
    data['is_blocked'] = isBlocked ?? false;
    data['muted_list'] = mutedList ?? [];
    data["show_images_user_list"] = showImagesUserList ?? [];
    return data;
  }

  @override
  String toString() {
    return threadId!;
  }
}
