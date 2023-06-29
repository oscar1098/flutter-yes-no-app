import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_boble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: const Padding(
          padding:  EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/550x/1d/8e/b0/1d8eb041bf4f6ca9cb216938ba97d095.jpg'),
          ),
        ),
        title: const Text('Chat 🐱'),
        centerTitle: false,
      ),

      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProider =  context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProider.chatScrollController,
                itemCount: chatProider.messageList.length,
                itemBuilder: (context, index) {

                  final message = chatProider.messageList[index];

                  return ( message.fromWho == FromWho.hers )
                  ?  HerMessageBubble(herMessage: message,  )
                  :  MyMessageBubble( message: message );
                },)
                ),
            // Caja de texto
             MessageFielBox(
              onValue: chatProider.sendMessage,
              ),
          ],
        ),
      ),
    );
  }
}