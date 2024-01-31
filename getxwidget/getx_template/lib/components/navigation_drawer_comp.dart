//getx : /flutterprojectnew30/getxwidet/group6-perm 참조
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationDrawerComp extends StatelessWidget {
  const NavigationDrawerComp({Key? key}) : super(key: key);

  Widget buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text('Jackie Code'),
      accountEmail: Text('jackie@sellon.net'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('assets/images/login.png'),
      ),
      currentAccountPictureSize: Size.square(72),
      otherAccountsPictures: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('Jackie'),
        )
      ],
      otherAccountsPicturesSize: Size.square(50),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color tileColor,
    required Function() onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: textIconColor),
      title: Text(
        text,
        style: TextStyle(color: textIconColor),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  navigate(int index) {
    switch (index) {
      case 1:
        Get.toNamed('/photo');
        break;
      case 2:
        Get.toNamed('/video');
        break;
      case 3:
        Get.toNamed('/chat');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            buildDrawerHeader(),
            Divider(
              color: Colors.grey,
            ),
            buildDrawerItem(
                icon: Icons.photo,
                text: 'Photo',
                tileColor:
                Get.currentRoute == '/photo' ? Colors.blue : Colors.white,
                textIconColor:
                Get.currentRoute == '/photo' ? Colors.white : Colors.black,
                onTap: () {
                  navigate(1);
                }),
            buildDrawerItem(
                icon: Icons.video_call,
                text: 'Video',
                tileColor:
                Get.currentRoute == '/video' ? Colors.blue : Colors.white,
                textIconColor:
                Get.currentRoute == '/video' ? Colors.white : Colors.black,
                onTap: () {
                  navigate(2);
                }),
            buildDrawerItem(
                icon: Icons.chat,
                text: 'Chat',
                tileColor:
                Get.currentRoute == '/chat' ? Colors.blue : Colors.white,
                textIconColor:
                Get.currentRoute == '/chat' ? Colors.white : Colors.black,
                onTap: () {
                  navigate(3);
                }),
          ],
        ),
      ),
    );
  }
}
