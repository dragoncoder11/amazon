import 'package:amazon/core/utils/constants.dart';
import 'package:amazon/core/utils/custom_button.dart';
import 'package:amazon/core/utils/custom_text_field.dart';
import 'package:amazon/core/utils/styles.dart';
import 'package:amazon/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:amazon/features/auth/presentation/views/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBody extends StatefulWidget {
  SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  bool obscureText = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
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
              if (state is RegisterSuccessState) {
                Navigator.of(context).pushReplacementNamed(Login.id);
              }
              if (state is FailedToRegisterState) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.blue,
                          content: Text(state.errMessage),
                        ));
              }
            },
            builder: (context, state) {
              if (state is RegisterLoadindState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
             
              return ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  const Text(
                    'Sign Up',
                    style: Styles.style35B0ld,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  CustomTextField(
                      controller: userNameController, hint: 'user name'),
                  CustomTextField(controller: emailController, hint: 'email'),
                  CustomTextField(controller: phoneController, hint: 'phone'),
                  CustomTextField(
                    controller: passwordController,
                    hint: 'password',
                    icon: obscureText ? Icons.visibility : Icons.visibility_off,
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText; // Corrected assignment
                      });
                    },
                    obscureText: obscureText, // Corrected parameter name
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  CustomButton(
                    onTap: () {
                      if (globalKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).regestration(
                            userName: userNameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            password: passwordController.text);
                      }
                    },
                    title: 'Sign Up',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(Login.id);
                      },
                      child: Text(
                        'Already have an account',
                        style: Styles.style16.copyWith(color: kPrimaryColor),
                        textAlign: TextAlign.center,
                      ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
