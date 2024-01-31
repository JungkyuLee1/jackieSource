import 'package:draggable_expandable_fab/draggable_expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DraggableExpandableFabPage extends StatelessWidget {
  const DraggableExpandableFabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Expandable Fab'),
      ),
      body: Center(
        child: Text('Draggable Expandable Fab'),
      ),
      floatingActionButton: ExpandableDraggableFab(
        childrenCount: 4,
        initialOpen: false,
        childrenTransition: ChildrenTransition.fadeTransation,
        childrenBoxDecoration: BoxDecoration(color: Colors.transparent),
        enableChildrenAnimation: true,
        curveAnimation: Curves.linear,
        reverseAnimation: Curves.linear,
        childrenType: ChildrenType.rowChildren,
        childrenAlignment: Alignment.centerLeft,
        initialDraggableOffset: Offset(Get.width * 0.4, Get.height - 50),
        distance: 100,
        onTab: () {},
        // openWidget: Icon(Icons.phone),
        children: [
          ElevatedButton(onPressed: (){}, child: Icon(Icons.bubble_chart),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.audiotrack,
            ),
            backgroundColor: Colors.purple,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.video_call,
            ),
            backgroundColor: Colors.purpleAccent,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.camera),
            backgroundColor: Colors.deepPurple,
          )
        ],
      ),
    );
  }
}
