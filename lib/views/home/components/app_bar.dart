import 'package:breaking_bad/views/login/view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget appBar(context) {
  return AppBar(
    actions: [
      IconButton(
        icon: Icon(Icons.signal_cellular_no_sim_outlined),
        onPressed: ()async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
        },
      ),
    ],
  );
}