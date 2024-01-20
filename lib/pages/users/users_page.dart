import 'package:chatting_app/api/bloc/user/user_bloc/user_event.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_bloc.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_event.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_state.dart';
import 'package:chatting_app/api/repository/user_repository.dart';
import 'package:chatting_app/configuration/firebase_configuration.dart';
import 'package:chatting_app/pages/users/user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await firebaseFirestore
                  .collection("users")
                  .doc(firebaseAuth.currentUser!.uid)
                  .update({
                "isOnline": false,
                "lastActive": DateTime.now(),
              });
              firebaseAuth.signOut();
            },
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ],
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, snapshot) {
          if (snapshot is UsersInitial) {
            context.read<UsersBloc>().add(GetAllUsers());
          }

          if (snapshot is UsersError) {
            return const Center(
              child: Text("Error!"),
            );
          }

          if (snapshot is UsersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot is UsersLoaded) {
            final stream = snapshot.userModels;

            return StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final users = snapshot.requireData
                      .where((element) =>
                          element.id != firebaseAuth.currentUser!.uid)
                      .toList();

                  return ListView.separated(
                    itemCount: users.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return UserItem(user: users[index]);
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          }

          return const Center(
            child: Text("No Data!"),
          );
        },
      ),
    );
  }
}
