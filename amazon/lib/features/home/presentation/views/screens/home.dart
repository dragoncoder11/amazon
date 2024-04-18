import 'package:amazon/features/home/presentation/views/screens/card.dart';
import 'package:amazon/features/home/presentation/views/screens/favourites.dart';
import 'package:amazon/features/home/presentation/views/screens/home_page.dart';
import 'package:amazon/features/home/presentation/views/screens/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});
  static String id = 'home';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List pagelist = const [
    HomePage(),
    Favourites(),
    AddToCart(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'favourites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          ]),
      body: pagelist.elementAt(selectedIndex),
    );
  }
}
