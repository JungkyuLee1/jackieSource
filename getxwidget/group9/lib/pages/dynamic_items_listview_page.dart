import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group9/controllers/dynamic_items_listview_controller.dart';

class DynamicItemsToListViewPage extends GetView<DynamicItemsToListViewController> {
  const DynamicItemsToListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Items to Listview'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: controller.nameTextEditingController,
                decoration: InputDecoration(
                  labelText: 'name',
                  hintText: 'name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  isDense: true
                ),
                onChanged: (val){
                  controller.name=val;
                },
              ),
              SizedBox(height: 10,),
              TextField(
                controller: controller.addressTextEditingController,
                decoration: InputDecoration(
                  labelText: 'address',
                  hintText: 'address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  isDense: true
                ),
                onChanged: (val){
                  controller.address=val;
                },
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                print('name : ${controller.name}');
                print('address : ${controller.address}');

                controller.addEmployee(name:controller.name!, address:controller.address!);
              }, child: Text('Save')),
              SizedBox(height: 20,),
              ListViewSection(),
            ],
          ),
        ),
      ),
    );
  }


  ListViewSection(){
    return Obx(
      ()=> Container(
        height: Get.height*0.6,
        child: ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
          // shrinkWrap: true,
            itemCount: controller.itemCount.value,
            itemBuilder: (context, index){
              final employee = controller.employees.value[index];

              return ListTile(
                title: Text(employee.name),
                subtitle: Text(employee.address),
                trailing: GestureDetector(
                    onTap: (){
                      controller.removeEmployee(index);
                    },
                    child: Icon(Icons.delete, color: Colors.red,)),
              );
            }),
      ),
    );
  }
}
