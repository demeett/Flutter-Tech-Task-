import 'package:flutter/material.dart';
import 'package:pokemon_project/pokemon_favorite/view/pokemon_favorite_view.dart';
import 'package:pokemon_project/pokemon_list/view/pokemon_list_view.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  List<Widget> pages = [PokemonListView(), const PokemonFavorite()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return pages[value];
            },
          ));
        },
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.catching_pokemon_sharp), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
        ]);
  }
}
