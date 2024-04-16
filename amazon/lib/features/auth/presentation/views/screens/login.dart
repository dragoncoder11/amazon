import 'package:flutter/material.dart';

import '../widgets/login_body.dart';
class Login extends StatelessWidget {
  const Login({super.key});
static String id='slogin';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:LoginBody() ,
    );
  }
}