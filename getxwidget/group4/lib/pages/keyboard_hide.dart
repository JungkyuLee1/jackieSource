import 'package:flutter/material.dart';

class KeyboardHidePage extends StatelessWidget {
  const KeyboardHidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hide Keyboard'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: 'Email'
                  ),
                ),
                Text("Let's test Keyboard showing", style: TextStyle(fontSize: 150),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
