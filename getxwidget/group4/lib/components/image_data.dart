import 'package:flutter/material.dart';

class ImageData extends StatelessWidget {
    const ImageData(this.icon, {this.width=30, Key? key}) : super(key: key);
    final String icon;
    final double? width;

    @override
    Widget build(BuildContext context) {
      return Image.asset(icon, width: width,);
    }
}

class IconPath{
  static String get homeOn =>'assets/images/bottom_nav_home_on_icon.jpg';
  static String get homeOff => 'assets/images/bottom_nav_home_off_icon.jpg';
  static String get searchOn => 'assets/images/bottom_nav_search_on_icon.jpg';
  static String get searchOff => 'assets/images/bottom_nav_search_off_icon.jpg';
  static String get uploadIcon => 'assets/images/bottom_nav_upload_icon.jpg';
  static String get activeOn => 'assets/images/bottom_nav_active_on_icon.jpg';
  static String get activeOff => 'assets/images/bottom_nav_active_off_icon.jpg';
  static String get logo => 'assets/images/logo.jpg';
  static String get directMessage => 'assets/images/direct_msg_icon.jpg';
  static String get more => 'assets/images/more_icon.jpg';
  static String get likeOffIcon => 'assets/images/like_off_icon.jpg';
  static String get replyIcon => 'assets/images/reply_icon.jpg';
  static String get bookMark => 'assets/images/book_mark_off_icon.jpg';
  static String get backBtnIcon => 'assets/images/back_icon.jpg';
  static String get closeIcon => 'assets/images/close_icon.jpg';
  static String get cameraIcon => 'assets/images/camera_icon.jpg';
  static String get downArrowIcon => 'assets/images/down_arrow_icon.jpg';
  static String get nextImage => 'assets/images/upload_next_icon.jpg';
  static String get imageSelectIcon => 'assets/images/image_select_icon.jpg';
  static String get menuIcon => 'assets/images/menu_icon.jpg';
  static String get addFriendIcon => 'assets/images/add_friend_icon.jpg';
  static String get gridViewOn => 'assets/images/grid_view_on_icon.jpg';
  static String get myTagImageOff => 'assets/images/my_tag_image_off_icon.jpg';
  static String get uploadComplete => 'assets/images/upload_complete_icon.jpg';

}