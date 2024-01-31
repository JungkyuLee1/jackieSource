import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group9/controllers/like_button_controller.dart';
import 'package:like_button/like_button.dart';

class LikeButtonPage extends GetView<LikeButtonController> {
  const LikeButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Like Button'),
      ),
      body: Center(
        child: LikeButton(
          size: 80,
          likeCount: controller.storage.read('likeCount') ??0,
          countPostion: CountPostion.bottom,
          likeBuilder: (isLiked){
            return Icon(Icons.monetization_on, color: isLiked? Colors.red : Colors.grey, size: 80,);
          },
          countBuilder: (likeCount, isLike, text){
            return Text(
              likeCount==0 ? '0' : text,
              style: TextStyle(color: isLike? Colors.red : Colors.grey, fontSize: 20),
            );
          },
          onTap: (isLiked){
            return controller.saveLikeCount(isLiked);
          },
          isLiked: controller.storage.read('isLiked') ?? false,
        ),
      ),
    );
  }
}
