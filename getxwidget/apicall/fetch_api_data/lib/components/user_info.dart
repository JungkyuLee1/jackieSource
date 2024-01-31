import 'package:flutter/material.dart';

import '../model/user.dart';

class UserInfo extends StatelessWidget {
  const UserInfo(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.picture.large) ,
            ),
            title: Text(user.name.title + ' ' + user.name.first + ' ' + user.name.last),
            subtitle: Text(user.email, style: TextStyle(fontSize: 12),),
            trailing: Text('Age : ' + user.dob.age.toString()),
          )
        ],
      ),
    );
  }
}
