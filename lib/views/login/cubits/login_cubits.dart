import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:breaking_bad/views/login/states/login_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  LoginCubit of(context) => BlocProvider.of(context);

  Future<String> login(String email , String password) async{
    final response = await Dio().post('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCV5njiqk7d51MFJJF3Ri2_c1NcenPm_wk',
        data: jsonEncode(
            {'email': email, 'password': password , 'returnSecureToken': true}
        ),
        options: Options(validateStatus: (status){
          return status <500;
        })
    );
    final data = response.data as Map;
    if(data.containsKey('idToken'))
    {
      String idToken = data['idToken'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('idToken', idToken);
      return'ok';
    } else
      emit(LoginInitialState());
    return'errorrrrrrr';

  }
}