import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group8/models/player_model.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelectDialogController extends GetxController {
  List<Player> players = [
    Player(country: 'India', name: 'Rohit Sharma'),
    Player(country: 'India', name: 'Virat Kohli'),
    Player(country: 'Australia', name: 'Glenn Maxwell'),
    Player(country: 'Australia', name: 'Aaron Finch'),
  ];

  List<dynamic> selectedPlayers = [];
  var selectPlayer = ''.obs;

  void showMultiSelect() async {
    await showDialog(
        context: Get.context!,
        builder: (context) {
          return MultiSelectDialog(
            initialValue: selectedPlayers,
            items: players
                .map((player) => MultiSelectItem(player, player.name!))
                .toList(),
            title: Text('Players'),
            selectedColor: Colors.blue,
            searchable: true,
            onConfirm: (results) {
              selectedPlayers = results;
              selectPlayer.value = '';
              selectedPlayers.forEach((element) {
                selectPlayer.value = selectPlayer.value + ', ' + element.name;
              });
            },
          );
        });
  }
}
