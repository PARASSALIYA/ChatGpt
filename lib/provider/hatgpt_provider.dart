import 'package:chatgpt_app/helper/chatgpt_helper.dart';
import 'package:chatgpt_app/model/chatgpt_model.dart';
import 'package:flutter/material.dart';

class ChatGptProvider with ChangeNotifier {
  ChatGptHelper helper = ChatGptHelper();
  List<String> getList = [];
  List<String> sendList = [];
  List<String> messageList = [];
  bool isRight = false;
  String l = '';
  ChatGptModel? model;
  String sendText = '';
  void getApi() async {
    model = await helper.getChatGptResponse(sendText);
    l = model!.candidates[0].content.parts[0].text;
    getList.add(l);
    sendList.add(sendText);

    notifyListeners();
  }
}
