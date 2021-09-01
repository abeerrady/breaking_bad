import 'package:breaking_bad/views/login/view.dart';
import 'package:breaking_bad/views/sign_Up/cubits/signup_cubit.dart';
import 'package:breaking_bad/views/sign_Up/states/signup_states.dart';
import 'package:breaking_bad/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpList extends StatelessWidget {
  SignUpCubit _signupCubit = SignUpCubit();

  bool isLoading = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
            Text(
              "Sing Up",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            DefaultTextFormField(
              controller: emailController,
              type: TextInputType.emailAddress,
              hintText: 'Email Address',
              validate: (String value) {
                if (value.isEmpty)
                  return 'email address must not be empty';
                else if (!value.contains('@'))
                  return 'missing@!';
                else
                  return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            DefaultTextFormField(
                controller: passwordController,
                hintText: 'Password',
                type: TextInputType.visiblePassword,
                validate: (String value) {
                  if (value.isEmpty)
                    return 'password must not be empty';
                  else if (value.length < 4)
                    return 'Length';
                  else
                    return null;
                }),
            SizedBox(
              height: 30,
            ),
            BlocBuilder(
              bloc: _signupCubit,
              builder: (context, state) => state is SignUpLoadingState
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (!formKey.currentState.validate()) return;

                        final message = await SignUpCubit().signup(
                            emailController.text, passwordController.text);
                        if (message != 'ok') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('message')));
                        } else {
                          print(emailController.text);
                          print(passwordController.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ));
                        }
                      },
                      child: Text('Register')),
            )
          ],
        ),
      ),
    );
  }
}
