import 'package:flutter/material.dart';
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
            child: BlocBuilder<ChatFeatureBloc, ChatFeatureState>(
              builder: (context, state) {
                if (state is ChatFeatureInitial) {
                  return const Center(
                      child: Text('Start chatting with Gemini AI!'));
                } else if (state is ChatLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ChatLoaded) {
                  return ListView.builder(
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.messages[index]),
                      );
                    },
                  );
                } else if (state is ChatError) {
                  return Center(child: Text(state.error));
                } else {
                  return Container();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Enter your message'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    callGeminiModel();
                    _controller.clear();
                    // final message = _controller.text;
                    // if (message.isNotEmpty) {
                    //   BlocProvider.of<ChatFeatureBloc>(context)
                    //       .add(SendMessage(message));
                    //   _controller.clear();
                    // }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
