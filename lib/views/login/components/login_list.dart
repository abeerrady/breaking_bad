import 'package:breaking_bad/views/home/view.dart';
import 'package:breaking_bad/views/login/cubits/login_cubits.dart';
import 'package:breaking_bad/views/login/cubits/login_cubits.dart';
import 'package:breaking_bad/views/login/states/login_states.dart';
import 'package:breaking_bad/views/sign_Up/view.dart';
import 'package:breaking_bad/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginList extends StatelessWidget {
  LoginCubit _loginCubit = LoginCubit();
  bool isLoading = false;

  var emailController = TextEditingController();
  var passwordController =TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Log in" ,
              style: TextStyle(color: Colors.black , fontSize: 40 , fontWeight: FontWeight.bold ),),
            SizedBox(height: 30,),
            DefaultTextFormField(
              controller: emailController,
              hintText: 'Email Address',
              type: TextInputType.emailAddress,
              validate: (String value){
                  if(value.isEmpty) return'email address must not be empty';
                  else if(!value.contains('@')) return'missing@!';
                  else return null;
                },
            ),
            SizedBox(height: 20,),

            DefaultTextFormField(
              controller: passwordController,
              hintText: 'Password',
              type: TextInputType.visiblePassword,
                validate: (String value){
                  if(value.isEmpty) return 'password must not be empty';
                  else if(value.length < 4) return 'Length';
                  else return null;
                },
            ),
            SizedBox(height: 30,),
            BlocBuilder(
              bloc: _loginCubit,
              builder: (context , state) => state is LoginLoadingState ? CircularProgressIndicator() : ElevatedButton(onPressed: ()async{
                if(!formKey.currentState.validate()) return;

                final message = await _loginCubit.login(emailController.text, passwordController.text);
                if(message !='ok') {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),));
                } else {
                  print(emailController.text);
                  print(passwordController.text);
                  Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => HomeView(),
                                              ));
                }
              }, child: Text('Login')),
            ),
            TextButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => SignUpView())),
                child: Text('Register'))
          ],
        ),
      ),
    );
  }
}
