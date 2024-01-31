import 'package:flutter/material.dart';
import 'package:responsive_whatsapp/src/common/values/app_color.dart';
import 'package:get/get.dart';

class WebProfileBar extends StatelessWidget {
  const WebProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.077,
      width: Get.width*0.5,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: dividerColor
          )
        ),
        color: webAppBarColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Novak_Djokovic_Hopman_Cup_2011_%28cropped%29.jpg/230px-Novak_Djokovic_Hopman_Cup_2011_%28cropped%29.jpg'),
            radius: 15,
          ),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.comment), color: Colors.grey,),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert), color: Colors.grey,)
            ],
          )
        ],
      ),
    );
  }
}
