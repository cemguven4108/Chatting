import 'package:chatting_app/api/bloc/auth/auth_bloc.dart';
import 'package:chatting_app/api/bloc/auth/auth_event.dart';
import 'package:chatting_app/api/bloc/user/user_bloc/user_bloc.dart';
import 'package:chatting_app/api/bloc/user/user_bloc/user_event.dart';
import 'package:chatting_app/api/bloc/user/user_bloc/user_state.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_bloc.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_event.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_state.dart';
import 'package:chatting_app/pages/home/user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read<AuthBloc>().add(LogoutEvent());
          },
          icon: const Icon(Icons.logout_outlined),
        ),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersStateInitialize) {
            context.read<UsersBloc>().add(UsersEventOpenStream());
          }

          if (state is UsersStateOpenedStream) {
            final users = state.users;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserItem(user: users[index]);
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}