import 'package:flutter/material.dart';

import '../widgets/sign_up_body.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
static String id='sign up';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SignUpBody() ,
    );
  }
}