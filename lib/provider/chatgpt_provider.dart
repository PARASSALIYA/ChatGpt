import 'package:chatgpt_app/helper/chatgpt_helper.dart';
import 'package:chatgpt_app/model/chatgpt_model.dart';
import 'package:flutter/material.dart';

class ChatGptProvider with ChangeNotifier {
  ChatGptHelper helper = ChatGptHelper();
  List<String> getList = [];
  List<String> sendList = [];
  bool isRight = false;
  String getText = '';
  ChatGptModel? model;
  String sendText = '';

  Future<void> sendMsg() async {
    model = await helper.getChatGptResponse(sendText);
    getText = model!.candidates[0].content.parts[0].text;
    getList.add(getText);
    notifyListeners();
  }

  void addSendMsg() {
    sendList.add(sendText);

    notifyListeners();
  }
}
