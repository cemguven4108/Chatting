import 'package:chatting_app/api/bloc/auth/auth_bloc.dart';
import 'package:chatting_app/api/bloc/auth/auth_event.dart';
import 'package:chatting_app/api/bloc/message/message_bloc.dart';
import 'package:chatting_app/api/bloc/user/user_bloc/user_bloc.dart';
import 'package:chatting_app/api/bloc/user/users_bloc/users_bloc.dart';
import 'package:chatting_app/api/service/auth_service.dart';
import 'package:chatting_app/api/service/message_service.dart';
import 'package:chatting_app/api/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// BlocProviders
final userBlocProvider = BlocProvider(
  create: (context) => UserBloc(
    UserService.instance(),
  ),
);

final usersBlocProvider = BlocProvider(
  create: (context) => UsersBloc(
    UserService.instance(),
    AuthService.instance(),
  ),
);

final messageBlocProvider = BlocProvider(
  create: (context) => MessageBloc(
    MessageService.instance(),
    AuthService.instance(),
  ),
);

final authBlocProvider = BlocProvider(
  create: (context) => AuthBloc(
    AuthService.instance(),
  )..add(AuthEventInitialize()),
);
