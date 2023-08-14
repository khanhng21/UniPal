import 'package:flutter/cupertino.dart';

class ChatUsers {
  String name = "khanh";
  String messageText = "hello";
  AssetImage imageURL;
  String time = 'now';
  ChatUsers(
      {required this.name,
      required this.messageText,
      required this.imageURL,
      required this.time});
}

