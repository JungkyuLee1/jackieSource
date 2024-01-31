import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_whatsapp/src/common/data/info.dart';
import 'package:responsive_whatsapp/src/common/values/app_color.dart';

class WebChatAppBar extends StatelessWidget {
  const WebChatAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.077,
      width: Get.width * 0.8,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: webAppBarColor,
          border: Border(
              left: BorderSide(
            color: dividerColor,
          ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Novak_Djokovic_Hopman_Cup_2011_%28cropped%29.jpg/230px-Novak_Djokovic_Hopman_Cup_2011_%28cropped%29.jpg',
                ),
                radius: 20,
              ),
              SizedBox(
                width: Get.width * 0.01,
              ),
              Text(infoData[0]['name'].toString()),
            ],
          ),
          Row(
            children: [
              Container(
                height: Get.height * 0.1,
                width: Get.width * 0.1,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white60),
                    borderRadius: BorderRadius.circular(7),
                    color: webAppBarColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      icon: Icon(
                        Icons.video_call,
                        size: 30,
                      ),
                      color: Colors.grey,
                    ),
                    Container(
                      height: 18,
                      width: 1,
                      color: Colors.grey,
                    ),
                    IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      icon: Icon(Icons.phone),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width * 0.015,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.search))
            ],
          ),
        ],
      ),
    );
  }
}
