import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum AvatarType { TYPE1, TYPE2, TYPE3 }

class AvatarWidget extends StatelessWidget {
  AvatarWidget(
      {required this.type,
      required this.thumbPath,
      this.hasStory,
      this.nickName,
      this.size = 50,
      Key? key})
      : super(key: key);

  bool? hasStory;
  String thumbPath;
  String? nickName;
  AvatarType type;
  double? size;

  Widget Type1Widget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.purple, Colors.orange]),
      ),
      child: Type2Widget()
    );
  }

  Widget Type2Widget() {
    return Container(
      padding: EdgeInsets.all(2),
      decoration:
          BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size!),
        child: Container(
          height: size,
          width: size,
          child: CachedNetworkImage(
            imageUrl: thumbPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget Type3Widget(){
    return Row(
      children: [
        Type1Widget(),
        Text(nickName==null ? '' : '$nickName' , style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.TYPE1:
        return Type1Widget();
      case AvatarType.TYPE2:
        return Type2Widget();
      case AvatarType.TYPE3:
      return Type3Widget();
    }
  }
}
