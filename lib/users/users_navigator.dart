import 'package:flutter/material.dart';
import 'package:navigator_2_example/users/user.dart';
import 'package:navigator_2_example/users/user_details_page.dart';
import 'package:navigator_2_example/users/users_page.dart';

class UsersNavigator extends StatefulWidget {
  const UsersNavigator({Key key}) : super(key: key);

  @override
  _UsersNavigatorState createState() => _UsersNavigatorState();
}

class _UsersNavigatorState extends State<UsersNavigator> {
  User _selectedUser;
  List<User> _users = [
    User('Tommy'),
    User('Arthur'),
    User('John'),
  ];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          key: ValueKey('UsersPage'),
          child: UsersPage(
            users: _users,
            userPressed: _userPressed,
          ),
        ),
        if (_selectedUser != null)
          MaterialPage(
            key: ValueKey(_selectedUser),
            child: UserDetailsPage(user: _selectedUser),
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;

        if (_selectedUser != null)
          setState(() {
            _selectedUser = null;
          });

        return true;
      },
    );
  }

  void _userPressed(user) {
    setState(() {
      _selectedUser = user;
    });
  }
}
