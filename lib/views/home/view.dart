import 'package:breaking_bad/views/home/components/char_list.dart';
import 'package:breaking_bad/views/home/cubits/home_cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/app_bar.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => HomeCubit()..getData(),
    child: Scaffold(
      appBar: appBar(context),
      body: CharactersList(),
    ),
    );
  }
}
