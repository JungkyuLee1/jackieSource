import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/expansion_panel_list_controller.dart';

import '../data/model/employee.dart';

class ExpansionPanelListPage extends GetView<ExpansionPanelListController> {
  const ExpansionPanelListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expansion Panel List'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Obx(
              () => ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  controller.employees[panelIndex].isExpanded!.value =
                      !isExpanded;
                },
                children: controller.employees
                    .map((Employee item) => ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(item.header!),
                          );
                        },
                        body: ListTile(
                          title: Text(item.body!),
                        ),
                        isExpanded: item.isExpanded!.value))
                    .toList(),
              ),
            ),
          ),
        ));
  }
}
