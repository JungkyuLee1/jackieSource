import 'package:flutter/material.dart';
import 'package:responsive_whatsapp/src/common/data/info.dart';
import 'package:responsive_whatsapp/src/common/values/app_color.dart';
import 'package:responsive_whatsapp/src/components/chat_list.dart';
import 'package:get/get.dart';

class MobileChatScreen extends StatelessWidget {
  MobileChatScreen({Key? key}) : super(key: key);
  TextEditingController messageController = TextEditingController();

  InputMessage() {
    return TextField(
      controller: messageController,
      decoration: InputDecoration(
        filled: true,
        fillColor: searchBarColor,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.grey,
            ),
          ),
        ),
        suffixIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: Get.width * 0.28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.camera),
              Icon(Icons.attach_file),
              Icon(Icons.money),
            ],
          ),
        ),
        hintText: 'Type a message',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(width: 0, style: BorderStyle.none)),
        contentPadding: EdgeInsets.all(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(infoData[0]['name'].toString()),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [Expanded(child: ChatList()), InputMessage()],
      ),
    );
  }
}
