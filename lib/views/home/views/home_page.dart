import 'package:chatgpt_app/provider/chatgpt_provider.dart';
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
        leading: const Icon(Icons.notes),
        title: const Text(' ChatGpt '),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.note_alt_outlined),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            (context.watch<ChatGptProvider>().sendList.isNotEmpty)
                ? Expanded(
                    child: ListView.builder(
                      itemCount:
                          context.watch<ChatGptProvider>().sendList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 10, bottom: 10),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xFF1D1B20),
                                ),
                                child: Text(
                                  context
                                      .watch<ChatGptProvider>()
                                      .sendList[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                (context
                                            .watch<ChatGptProvider>()
                                            .getList
                                            .isNotEmpty &&
                                        context
                                                .watch<ChatGptProvider>()
                                                .getList
                                                .length >
                                            index)
                                    ? Flexible(
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          margin: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                            color: Colors.brown,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(14),
                                              bottomRight: Radius.circular(14),
                                              bottomLeft: Radius.circular(14),
                                            ),
                                          ),
                                          child: Text(
                                            context
                                                .watch<ChatGptProvider>()
                                                .getList[index],
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Image.asset(
                                        'assets/gif/loading.gif',
                                        height: 25,
                                      ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: Container(),
                  ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Enter your question',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    context.read<ChatGptProvider>().sendText = controller.text;
                    controller.clear();
                    context.read<ChatGptProvider>().addSendMsg();
                    await context.read<ChatGptProvider>().sendMsg();
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
