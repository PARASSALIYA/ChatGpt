import 'package:chatgpt_app/provider/hatgpt_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' ChatGpt '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<ChatGptProvider>().sendList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(
                        child: Text(
                            context.watch<ChatGptProvider>().sendList[index])),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<ChatGptProvider>().getList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(
                        child: Text(
                            context.watch<ChatGptProvider>().getList[index])),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: (val) {
                      controller.text = val;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Enter your question',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<ChatGptProvider>().sendText = controller.text;
                    context.read<ChatGptProvider>().getApi();
                    controller.clear();
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
