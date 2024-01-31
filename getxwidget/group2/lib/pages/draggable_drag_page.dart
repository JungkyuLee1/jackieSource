import 'package:flutter/material.dart';

class DraggableDragPage extends StatelessWidget {
  const DraggableDragPage({Key? key}) : super(key: key);

  _draggable() {
    return Draggable(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.deepPurple,
      ),
      feedback: Container(
        height: 100,
        width: 100,
        color: Colors.red,
      ),
      childWhenDragging: Container(
        height: 100,
        width: 100,
        color: Colors.green,
      ),
      axis: Axis.vertical,
      onDragStarted: () {
        print('Drag started!');
      },
      onDragCompleted: () {
        print('Drag completed!');
      },
      onDragEnd: (draggableDetails) {
        print('Drag Ended! : ${draggableDetails}');
      },
      onDraggableCanceled: (velocity, offset) {
        print('Canceled velocity : $velocity, offset : $offset');
      },
      onDragUpdate: (dragUpdateDetails) {
        print('dragUpdateDetails : $dragUpdateDetails');
      },
      maxSimultaneousDrags: 1,
      data: 'demo',
    );
  }

  _dragTarget(bool condition) {
    return DragTarget(
      builder: (context, acceptedData, rejectedData) {
        return condition
            ? Container(
                height: 100,
                width: 100,
                color: Colors.orange,
              )
            : Container(
                height: 100,
                width: 100,
                color: Colors.black,
              );
      },
      onWillAccept: (data) {
        print('data : $data');
        return true;
      },
      //onWillAccept 가 true 일 경우만 onAccept 작동
      onAccept: (data) {
        condition = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool condition = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable & Drag Targets'),
      ),
      body: Center(
        child: Column(
          children: [
            _draggable(),
            SizedBox(
              height: 20,
            ),
            _dragTarget(condition),
          ],
        ),
      ),
    );
  }
}
