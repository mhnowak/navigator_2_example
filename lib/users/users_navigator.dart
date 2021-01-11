import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigator_2_example/users/user.dart';
import 'package:navigator_2_example/users/user_details_page.dart';
import 'package:navigator_2_example/users/users_page.dart';
import 'package:navigator_2_example/users/users_repository.dart';

class UsersState {
  final List<User> users;
  final User selectedUser;

  UsersState(
    this.users, {
    this.selectedUser,
  });
}

class UsersNavigator extends StatelessWidget {
  const UsersNavigator({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UsersRepository(),
      child: FlowBuilder<UsersState>(
        state: UsersState([
          User('Tommy'),
          User('Arthur'),
          User('John'),
        ]),
        onGeneratePages: (state, pages) {
          final selectedUser = state.selectedUser;
          return [
            MaterialPage(
              key: ValueKey('UsersPage'),
              child: UsersPage(
                users: state.users,
              ),
            ),
            if (selectedUser != null)
              MaterialPage(
                key: ValueKey(selectedUser),
                child: UserDetailsPage(user: selectedUser),
              ),
          ];
        },
      ),
    );
  }
}
