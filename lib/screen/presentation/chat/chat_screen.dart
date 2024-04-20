import 'package:flutter/material.dart';
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
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return index % 2 == 0
                  ? const MessageBubble()
                  : const HerMessageBubble();
            },
          )),
          TextFieldCustom()
        ],
      ),
    ));
  }
}
