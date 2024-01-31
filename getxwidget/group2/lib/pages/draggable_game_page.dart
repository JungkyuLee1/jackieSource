import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group2_features/controllers/draggable_game_controller.dart';
import 'package:flutter/material.dart';

class DraggableGamePage extends GetView<DraggableGameController> {
  const DraggableGamePage({Key? key}) : super(key: key);

  Widget _buildDraggableWithNoItem() {
    return Container(
      height: 100,
      width: 100,
      child: Text(
        'No Item',
        style: TextStyle(color: Colors.white),
      ),
      alignment: Alignment.center,
      color: Colors.black,
    );
  }

  Widget _buildDraggable(String text) {
    return Container(
      height: 100,
      width: 100,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      alignment: Alignment.center,
      color: Colors.red,
    );
  }

  Widget _buildDragTarget(
      {required String text, required Color color, required int acceptType}) {
    return DragTarget(
      builder: (context, acceptData, rejectData) {
        return Container(
          height: 100,
          width: 100,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          alignment: Alignment.center,
          color: color,
        );
      },
      onWillAccept: (data) {
        return true;
      },
      onAccept: (data) {
        controller.checkAcceptType(data, acceptType);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable & Drag Targets'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(
            () => Stack(
              children: controller.numbers.length == 0
                  ? [_buildDraggableWithNoItem()]
                  : controller.numbers
                      .map((num) => Draggable(
                            data: num,
                            child: _buildDraggable(num.toString()),
                            feedback: _buildDraggable(num.toString()),
                            childWhenDragging: Container(
                              height: 100,
                              width: 100,
                            ),
                          ))
                      .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDragTarget(
                  text: 'Even', color: Colors.lightBlue, acceptType: 1),
              _buildDragTarget(
                  text: 'Odd', color: Colors.deepPurple, acceptType: 0),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                controller.restartGame();
              },
              child: Text('Restart'))
        ],
      ),
    );
  }
}
