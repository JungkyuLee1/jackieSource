import 'package:flutter/material.dart';
import 'package:responsive_whatsapp/src/common/data/info.dart';
import 'package:responsive_whatsapp/src/components/my_message_card.dart';
import 'package:responsive_whatsapp/src/components/sender_message_card.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index){
          final message = messages[index];

          if(message['isMe']==true){
            return MyMessageCard(message: message['text'].toString(), date: message['time'].toString());
          }else{
            return SenderMessageCard(message: message['text'].toString(), date: message['time'].toString(),);
          }
        });
  }
}
