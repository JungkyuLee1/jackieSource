import 'package:flutter/material.dart';
import 'package:responsive_whatsapp/src/common/values/app_color.dart';
import 'package:responsive_whatsapp/src/components/chat_list.dart';
import 'package:responsive_whatsapp/src/components/contacts_list.dart';
import 'package:responsive_whatsapp/src/components/message_input_box.dart';
import 'package:responsive_whatsapp/src/components/web_chat_appBar.dart';
import 'package:responsive_whatsapp/src/components/web_profile_bar.dart';
import 'package:responsive_whatsapp/src/components/web_search_bar.dart';

class WebScreenLayout extends StatelessWidget {
  WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                WebProfileBar(),
                WebSearchBar(),
                Expanded(child: ContactsList()),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.75,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bkground-black.jpg'),
                  fit: BoxFit.cover),
              border: Border(
                left: BorderSide(
                  color: dividerColor,
                  // width: 0,
                  style: BorderStyle.none
                )
              )
            ),
            child: Column(
              children: [
                WebChatAppBar(),
                Expanded(child: ChatList()),
                MessageInputBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
