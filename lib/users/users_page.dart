import 'package:flutter/material.dart';
import 'package:navigator_2_example/users/user.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:navigator_2_example/users/users_navigator.dart';

class UsersPage extends StatelessWidget {
  final List<User> users;

  const UsersPage({
    Key key,
    this.users,
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
                ))
            .toList(),
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  final User user;

  const UserWidget({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        context.flow<UsersState>().update(
              (state) => UsersState(
                state.users,
                selectedUser: user,
              ),
            );
      },
      child: Container(
        alignment: Alignment.center,
        height: 200,
        width: double.infinity,
        child: Text(user.name),
      ),
    );
  }
}
