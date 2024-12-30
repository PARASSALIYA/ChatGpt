import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/chatgpt_model.dart';

class ChatGptHelper {
  static ChatGptHelper chatGptHelper = ChatGptHelper();

  Future<ChatGptModel?> getChatGptResponse(String text) async {
    String link =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyAmTiktosARnphG2srriRPUQyl1OjpJh50";

    http.Response response = await http.post(
      Uri.parse(link),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": text}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      ChatGptModel model = ChatGptModel.mapToModel(data);
      return model;
    }
    return null;
  }
}
