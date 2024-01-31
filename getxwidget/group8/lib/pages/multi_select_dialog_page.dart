import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group8/controllers/multi_select_dialog_controller.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelectDialogPage extends GetView<MultiSelectDialogController> {
  const MultiSelectDialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Select Dialog'),
      ),
      body: Column(
        children: [
          MultiSelectDialogField(
              listType: MultiSelectListType.LIST,
              chipDisplay: MultiSelectChipDisplay.none(),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: Colors.blue, width: 2)),
              buttonIcon: Icon(
                Icons.account_box,
                color: Colors.blue,
              ),
              buttonText: Text(
                "Favorite Players",
                style: TextStyle(fontSize: 16, color: Colors.blue[800]),
              ),
              items: controller.players
                  .map((player) => MultiSelectItem(player, player.name!))
                  .toList(),
              title: Text('Players'),
              selectedColor: Colors.blue,
              searchable: true,
              onConfirm: (results) {
                controller.selectedPlayers = results;
                controller.selectPlayer.value = "";
                controller.selectedPlayers.forEach((element) {
                  controller.selectPlayer.value =
                      controller.selectPlayer.value + ', ' + element.name;
                });
              }),
          SizedBox(
            height: 20,
          ),
          Obx(() => Text(controller.selectPlayer.value)),
          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){
            controller.showMultiSelect();
          }, child: Text('Select Player'))

        ],
      ),
    );
  }
}
