import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String? id;
  String? message;
  Timestamp? messageTime;
  String? senderId;
  String? threadId;
  String? filePath;
  int? fileType;
  int? messageType;
  List<dynamic>? participantUserList;
  String? replyMessage;
  String? replyMessageType;
  String? mainMessageId;

  static const int MESSAGE_TYPE_TEXT = 0;
  static const int MESSAGE_TYPE_IMAGE = MESSAGE_TYPE_TEXT + 1;
  static const int MESSAGE_TYPE_AUDIO = MESSAGE_TYPE_IMAGE + 1;
  static const int REPLY_TO_MESSAGE = MESSAGE_TYPE_AUDIO + 1;

  ChatModel();

  ChatModel.fromJson(Map<String, dynamic> json) {
    participantUserList = json['participant_user_list'] ?? [];

    message = json['message'];
    messageTime = json['message_time'];
    senderId = json['sender_id'];
    threadId = json['thread_id'];
    filePath = json['file_path'];
    fileType = json['file_type'];
    messageType = json['message_type'];
    replyMessage = json['reply_message'];
    replyMessageType = json['reply_message_type'];
    mainMessageId = json['main_message_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["participant_user_list"] = participantUserList ?? [];

    data['message'] = message;
    data['message_time'] = messageTime;
    data['sender_id'] = senderId;
    data['thread_id'] = threadId;
    data['file_path'] = filePath;
    data['file_type'] = fileType;
    data['id'] = id;
    data['message_type'] = messageType;
    data['reply_message'] = replyMessage;
    data['reply_message_type'] = replyMessageType;
    data['main_message_id'] = mainMessageId;
    return data;
  }
}
