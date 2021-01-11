import 'package:flutter/material.dart';
import 'package:navigator_2_example/users/users_navigator.dart';

void main() {
  runApp(const UsersApp());
}

class UsersApp extends StatelessWidget {
  const UsersApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const UsersNavigator(),
    );
  }
}
