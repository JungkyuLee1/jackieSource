import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/emojipicker_controller.dart';

class EmojiPickerPage extends GetView<EmojiPickerController> {
  const EmojiPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emoji Picker'),
      ),
      body: WillPopScope(
        onWillPop: (){
          if(controller.isEmojiVisible.value){
            controller.isEmojiVisible.value=false;
          }else{
            Navigator.pop(context);
          }
          return Future.value(false);
        },
        child: Column(
          children: [
            Expanded(child: Container()),
            Container(
              height: 70,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.isEmojiVisible.value =
                          !controller.isEmojiVisible.value;
                      controller.focusNode.unfocus();
                      controller.focusNode.canRequestFocus = true;
                    },
                    icon: Icon(Icons.emoji_emotions),
                    color: Colors.blue,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      child: TextField(
                        controller: controller.emojiController,
                        focusNode: controller.focusNode,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            fillColor: Colors.white,
                            hintText: 'Type a message',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              //offstate = false는 보여줌, true(안보여줌)
              () => Offstage(
                offstage: !controller.isEmojiVisible.value,
                child: Container(
                  color: Colors.red,
                  height: 250,
                  child: EmojiPicker(
                    onEmojiSelected: (category, emoji) {
                      controller.emojiController.text =
                          controller.emojiController.text + emoji.emoji;
                    },
                    onBackspacePressed: () {},
                    config: Config(
                        columns: 7,
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        initCategory: Category.SMILEYS,
                        bgColor: Color(0xFFF2F2F2),
                        indicatorColor: Colors.blue,
                        iconColor: Colors.grey,
                        iconColorSelected: Colors.blue,
                        recentsLimit: 28,
                        noRecents: Text(
                          'No Recents',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
