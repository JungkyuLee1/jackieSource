import 'package:flutter/material.dart';

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unknown'),),
      body: Center(
        child: Text('Unknown Route Page', style: TextStyle(fontSize: 24),),
      ),
    );
  }
}

