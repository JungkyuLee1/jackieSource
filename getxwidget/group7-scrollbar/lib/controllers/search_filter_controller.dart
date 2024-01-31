import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchFilterController extends GetxController {
  List<Map<String, dynamic>> allPlayers = [
    {'name': "Rohit Sharma", 'country': 'india'},
    {'name': 'Virat Kohli', 'country': 'India'},
    {'name': 'Glenn Maxwell', 'country': 'Australia'},
    {'name': 'Aaron Finch', 'country': 'Australila'},
    {'name': 'Martin Guptill', 'country': 'New Zealand'},
    {'name': 'Trent Boult', 'country': 'New zealand'},
    {'name': 'David Miller', 'country': 'South Africa'},
    {'name': 'Kagiso Rabada', 'country': 'South Africa'},
    {'name': 'Chris Gayle', 'country': 'West Indies'},
    {'name': 'Jason Holder', 'country': 'West Indies'},
  ];

  late TextEditingController textController;
  Rx<List<Map<String, dynamic>>> foundPlayers =
      Rx<List<Map<String, dynamic>>>([]);

  @override
  void onInit() {
    super.onInit();
    textController = TextEditingController();
    foundPlayers.value = allPlayers;
  }

  // var foundPlayers = RxList<Map<String, dynamic>>();

  void filterPlayers(String playerName) {
    List<Map<String, dynamic>> results = [];

    if (playerName.isEmpty) {
      results = allPlayers;
    } else {
      results = allPlayers
          .where((player) => player['name']
              .toString()
              .toLowerCase()
              .contains(playerName.toLowerCase()))
          .toList();
    }
    foundPlayers.value = results;
  }
}
