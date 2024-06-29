part of 'chat_feature_bloc.dart';

@immutable
sealed class ChatFeatureEvent extends Equatable {
  const ChatFeatureEvent();

  @override
  List<Object> get props => [];
}

class SendMessage extends ChatFeatureEvent {
  final String message;

  const SendMessage(this.message);

  @override
  List<Object> get props => [message];
}
