part of 'chat_feature_bloc.dart';

@immutable
sealed class ChatFeatureState extends Equatable {
  const ChatFeatureState();

  @override
  List<Object> get props => [];
}

class ChatFeatureInitial extends ChatFeatureState {}

class ChatLoading extends ChatFeatureState {}

class ChatProcessing extends ChatFeatureState {
  final String messages;

  const ChatProcessing(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatLoaded extends ChatFeatureState {
  final List<String> messages;

  const ChatLoaded(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatError extends ChatFeatureState {
  final String error;

  const ChatError(this.error);

  @override
  List<Object> get props => [error];
}
