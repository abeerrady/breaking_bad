import 'package:breaking_bad/views/login/components/login_list.dart';
import 'package:breaking_bad/views/login/cubits/login_cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => LoginCubit(),
    child: Scaffold(
      body: LoginList(),
    ),
    );
  }
}
