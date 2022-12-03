import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.catching_pokemon_sharp), label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
    ]);
  }
}
