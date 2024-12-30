import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chatgpt_app/provider/chatgpt_provider.dart';
import 'package:chatgpt_app/views/home/views/home_page.dart';

void main() {
  runApp(
    const ChatGptApp(),
  );
}

class ChatGptApp extends StatefulWidget {
  const ChatGptApp({super.key});

  @override
  State<ChatGptApp> createState() => _ChatGptAppState();
}

class _ChatGptAppState extends State<ChatGptApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ChatGptProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
