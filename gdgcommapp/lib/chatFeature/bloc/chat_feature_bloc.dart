import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
// import 'chat_event.dart';
// import 'chat_state.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'chat_feature_event.dart';
part 'chat_feature_state.dart';

class ChatFeatureBloc extends Bloc<ChatFeatureEvent, ChatFeatureState> {
  final GenerativeModel generativeAiClient;

  ChatFeatureBloc(this.generativeAiClient) : super(ChatFeatureInitial()) {
    // on<ChatFeatureEvent>((event, emit) {});
    on<SendMessage>(_sendMessage);
  }
  List<String> apiResponse = [];

  FutureOr<void> _sendMessage(
      SendMessage event, Emitter<ChatFeatureState> emit) async {
    emit(ChatProcessing(event.message));
    print(event.message);
    try {
      final model = GenerativeModel(
          // model: 'gemini-1.5-flash',
          model: 'gemini-pro',
          apiKey: 'AIzaSyCkIwgMVXnmY6WgJrK_bxmaDOK3ev-OG3c');
      final prompt = event.message.trim();
      final contentMain = [Content.text(prompt)];
      print('content');
      print(contentMain);
      final response = await model.generateContent(contentMain);
      if (response.text != null) {
        // apiResponse.add(response as String);
        print(response.text);
        emit(ChatLoaded(apiResponse as List<String>));
      } else {
        print('Failed to load response');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
