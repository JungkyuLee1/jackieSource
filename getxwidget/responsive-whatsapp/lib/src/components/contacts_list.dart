import 'package:flutter/material.dart';
import 'package:responsive_whatsapp/src/common/data/info.dart';
import 'package:responsive_whatsapp/src/common/values/app_color.dart';
import 'package:get/get.dart';
import 'package:responsive_whatsapp/src/pages/mobile_chat_screen.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: infoData.length,
          itemBuilder: (context, index) {
            final info = infoData[index];

            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed('/mobileChatScreen');
                  },
                  child: ListTile(
                    title: Text(
                      info['name'].toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      info['message'].toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage(info['profilePic'].toString()),
                    ),
                    trailing: Text(
                      info['time'].toString(),
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                ),
                Divider(
                  color: dividerColor,
                ),
              ],
            );
          }),
    );
  }
}
