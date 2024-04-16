import 'package:amazon/core/utils/custom_button.dart';
import 'package:amazon/core/utils/custom_text_field.dart';
import 'package:amazon/core/utils/styles.dart';
import 'package:amazon/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:amazon/features/auth/presentation/views/screens/sign_up.dart';
import 'package:amazon/features/home/presentation/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constants.dart';

class LoginBody extends StatefulWidget {
  LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool obscureText = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
                if (state is LoginSuccessState) {
                Navigator.of(context).pushReplacementNamed(Home.id);
              }
            },
            builder: (context, state) {
                 if (state is LoginLoadindState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is FailedToLoginState) {
                return Center(child: Text(state.errMessage));
              }
              return ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  const Text(
                    'Login',
                    style: Styles.style35B0ld,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  CustomTextField(controller: emailController, hint: 'email'),
                  CustomTextField(
                    controller: passwordController,
                    hint: 'password',
                    icon: obscureText ? Icons.visibility : Icons.visibility_off,
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    obscureText: obscureText,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  CustomButton(
                    onTap: () {
                      if (globalKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).login(
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                    title: 'Login',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(SignUp.id);
                      },
                      child: Text(
                        'Don\'t have an account ',
                        style: Styles.style16.copyWith(color: kPrimaryColor),
                        textAlign: TextAlign.center,
                      )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
