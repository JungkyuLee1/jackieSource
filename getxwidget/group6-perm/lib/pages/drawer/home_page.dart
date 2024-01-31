import 'package:flutter/material.dart';
import 'package:group6_withpermission/components/navigation_drawer_comp.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: NavigationDrawerComp(),
      body: Center(
        child: Text('Home Page'),
      ),
    );

  }
}
