import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/search_filter_controller.dart';

class SearchFilterPage extends GetView<SearchFilterController> {
  const SearchFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Filter'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: controller.textController,
              decoration: InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
              onChanged: (playerName){
                controller.filterPlayers(playerName);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(
                ()=> ListView.builder(
                    itemCount: controller.foundPlayers.value.length,
                    itemBuilder: (context, index) {
                      final player = controller.foundPlayers.value[index];
                      return GestureDetector(
                        onTap: (){
                          controller.textController.text = player['name'];
                        },
                        child: ListTile(
                          title: Text(
                            player['name'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(player['country']),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
