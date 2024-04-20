import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesno/domain/entities/message.dart';
import 'package:yesno/screen/presentation/provider/MessageProvider.dart';
import 'package:yesno/screen/presentation/shared/text_field.dart';
import 'package:yesno/screen/presentation/widgets/her_message_bubble.dart';
import 'package:yesno/screen/presentation/widgets/message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.all(4),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/474x/36/92/bc/3692bcdcfcde3439b14f3d93b37182f7.jpg'),
          ),
        ),
        title: const Text("Mi amor "),
      ),
      body: const ChatBody(),
    );
  }
}

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<MessageProvider>();
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
            itemCount: chatProvider.messages.length,
            itemBuilder: (context, index) {
              final message = chatProvider.messages[index];
              return message.who == Whos.her 
                  ?  HerMessageBubble(message: message.text, urlimage: message.image)
                  :  MessageBubble(message: message.text,);
            },
          )),
          TextFieldCustom(onValue: chatProvider.sendMessage)
        ],
      ),
    ));
  }
}
