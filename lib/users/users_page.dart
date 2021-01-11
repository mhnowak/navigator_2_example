import 'package:flutter/material.dart';
import 'package:navigator_2_example/users/user.dart';

class UsersPage extends StatelessWidget {
  final Function(User user) userPressed;
  final List<User> users;

  const UsersPage({
    Key key,
    this.users,
    this.userPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
      ),
      body: Column(
        children: users
            .map((user) => UserWidget(
                  user: user,
                  onPressed: () => userPressed(user),
                ))
            .toList(),
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final User user;

  const UserWidget({
    Key key,
    this.user,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 200,
        width: double.infinity,
        child: Text(user.name),
      ),
    );
  }
}
