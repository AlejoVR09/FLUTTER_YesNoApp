import 'package:flutter/material.dart';
import 'package:yesno/domain/entities/message.dart';
import 'package:yesno/helpers/get_yes_no_answer.dart';

class MessageProvider extends ChangeNotifier {
  final scrollController = ScrollController();
  final getMessage = GetYesNoAnswer();

  List<MessageEntity> messages = [];

  getMessageAPI() async {
    messages.add(await getMessage.getMessage());
    notifyListeners();
    scrollToBottom();
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) {
      return;
    }
    messages.add(MessageEntity(text: text, who: Whos.him));
    if (text.endsWith('?')) {
      getMessageAPI();
    }
    notifyListeners();
    scrollToBottom();
  }

  Future<void> scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}
