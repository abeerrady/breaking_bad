import 'package:breaking_bad/views/splash/cubits/splash_cubit.dart';
import 'package:breaking_bad/views/splash/states/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SplashCubit()..getData(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<SplashCubit , SplashStates>(
          listener: (context , state){},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  width: 250,
                  height: 250,
                  child: Image.network('https://www.pngall.com/wp-content/uploads/5/Hello-Speech-Bubble.png' , fit: BoxFit.cover,),
                ),
              )
            ],),
        )
      ),
    );
  }
}
