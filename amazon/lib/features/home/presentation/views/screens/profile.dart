import 'package:amazon/features/home/presentation/views/screens/card.dart';
import 'package:amazon/features/home/presentation/views/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AddToCart.CustomAppbar(context, title: 'Profile', icon: Icons.person),
    body: const ProfileBody());
  }
}