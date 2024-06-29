import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gdgcommapp/chatFeature/bloc/chat_feature_bloc.dart';
import 'package:gdgcommapp/repository/model/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatScene extends StatefulWidget {
  const ChatScene({super.key});

  @override
  State<ChatScene> createState() => _ChatSceneState();
}

final TextEditingController _controller = TextEditingController();

class _ChatSceneState extends State<ChatScene> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  bool _isLoading = false;
  callGeminiModel() async {
    try {
      if (_controller.text.isNotEmpty) {
        _messages.add(Message(text: _controller.text, isUser: true));
        _isLoading = true;
      }

      final model = GenerativeModel(
          model: 'gemini-pro',
          apiKey: 'AIzaSyCkIwgMVXnmY6WgJrK_bxmaDOK3ev-OG3c');
      final prompt = _controller.text.trim();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      setState(() {
        _messages.add(Message(text: response.text!, isUser: false));
        _isLoading = false;
      });

      _controller.clear();
    } catch (e) {
      print("Error : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Chat With Gemini',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.chat,
              color: Color.fromRGBO(249, 189, 12, 1),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: message.isUser
                              ? const Color.fromRGBO(249, 189, 12, 1)
                              : const Color.fromRGBO(72, 137, 246, 1),
                          borderRadius: message.isUser
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                )
                              : const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                        ),
                        child: Text(message.text,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )
                            // message.isUser
                            //     ? Theme.of(context).textTheme.bodyMedium
                            //     : Theme.of(context).textTheme.bodySmall,
                            ),
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                        hintText: 'Enter your message...',
                        fillColor: Colors.white,
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 110, 110, 110),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 189, 12, 1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      color: Colors.white,
                      Icons.send,
                    ),
                    onPressed: () {
                      callGeminiModel();
                      _controller.clear();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
