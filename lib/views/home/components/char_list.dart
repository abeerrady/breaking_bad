import 'package:breaking_bad/views/home/cubits/home_cubits.dart';
import 'package:breaking_bad/views/home/states/home_states.dart';
import 'package:breaking_bad/views/home/widgets/char_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = HomeCubit.of(context);
    return BlocBuilder(
      bloc: controller,
      builder: (context , state) => state is HomeLoadingState ? Center(
        child: CircularProgressIndicator(),
    ) : ListView.builder(
        itemCount: controller.charactersList.length,
        itemBuilder: (context , index) {
          final char = controller.charactersList[index];
          return CharactersCard(
            image: char.img,
            name: char.name,
            birthday: char.birthday,
            nickname: char.nickname,
          );
        },

      )
    );
  }
}
