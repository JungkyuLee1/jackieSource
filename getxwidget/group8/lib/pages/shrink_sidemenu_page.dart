import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group8/controllers/shrink_sidemenu_controller.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class ShrinkSideMenuPage extends GetView<ShrinkSideMenuController> {
  const ShrinkSideMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: controller.sideMenuKey,
      type: SideMenuType.slideNRotate,
      menu: buildMenu(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shrink Side Menu'),
          leading: IconButton(
            onPressed: () {
              controller.openCloseSideMenu();
            },
            icon: Icon(Icons.menu),
          ),
        ),
        body: Center(
          child: Text(
            'Side Menu',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }

  makeListTile(String title, IconData icon, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
        color: Colors.white,
      ),
      title: Text(title),
      textColor: Colors.white,
      dense: true,
      onTap: onTap,
    );
  }

  buildMenu() {
    return SingleChildScrollView(
      child: Column(
        children: [
          makeListTile('Home', Icons.home, () {
            print('Home');
          }),
          makeListTile('Profile', Icons.verified_user, () {
            print('Profile');
          }),
          makeListTile('Wallet', Icons.monetization_on, () {
            print('Wallet');
          }),
          makeListTile('Cart', Icons.add_shopping_cart, () {
            print('Cart');
          }),
          makeListTile('Favorites', Icons.favorite_border, () {
            print('Favorites');
          }),
          makeListTile('Settings', Icons.settings, () {
            print('Settings');
          }),
        ],
      ),
    );
  }
}
