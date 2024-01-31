import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_whatsapp/src/common/values/app_color.dart';

class MessageInputBox extends StatelessWidget {
  const MessageInputBox({Key? key}) : super(key: key);

  InputBox(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: searchBarColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none
            )
          ),
          hintText: 'Type a message'
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.07,
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      decoration: BoxDecoration(
        color: chatBarMessage,
        border: Border(
          bottom: BorderSide(
            color: dividerColor
          )
        )
      ),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.emoji_emotions), onPressed: (){},),
          IconButton(onPressed: (){}, icon: Icon(Icons.attach_file_outlined)),
          Expanded(child: InputBox(),),
          IconButton(onPressed: (){}, icon: Icon(Icons.mic))
        ],
      ),
    );
  }
}
