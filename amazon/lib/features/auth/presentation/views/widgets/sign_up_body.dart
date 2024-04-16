import 'package:amazon/core/utils/constants.dart';
import 'package:amazon/core/utils/custom_button.dart';
import 'package:amazon/core/utils/custom_text_field.dart';
import 'package:amazon/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          child: ListView(
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
              CustomTextField(controller: userNameController, hint: 'user name'),
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
              CustomButton(onTap: (){
                if(globalKey.currentState!.validate()){
          
                }
              },title: 'Sign Up',),
               const SizedBox(
                height: 30,
              ),
              GestureDetector(onTap: () {
                Navigator.of(context).pop();
              },child: Text('Already have an account',style: Styles.style16.copyWith(color: kPrimaryColor),textAlign: TextAlign.center,))
            ],
          ),
        ),
      ),
    );
  }
}
