

import 'package:bloc/bloc.dart';
import 'package:breaking_bad/views/home/view.dart';
import 'package:breaking_bad/views/login/view.dart';
import 'package:breaking_bad/views/splash/states/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(SplashInitialState());

  Future<void> getData(context)async{
    final prefs = await SharedPreferences.getInstance();
    final idToken = prefs.getString('idToken');
    if (idToken == null) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
    else Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
  }
}