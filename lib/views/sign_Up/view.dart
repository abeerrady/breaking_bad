import 'package:breaking_bad/views/sign_Up/components/signup_list.dart';
import 'package:breaking_bad/views/sign_Up/cubits/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SignUpCubit(),
    child: Scaffold(
    body: SignUpList(),
    ),
    );
  }
}
