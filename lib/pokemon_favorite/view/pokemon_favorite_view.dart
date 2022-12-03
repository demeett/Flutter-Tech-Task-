import 'package:flutter/material.dart';
import 'package:pokemon_project/nav_bar/custom_nav_bar.dart';
import 'package:pokemon_project/pokemon_list/model/pokemon_list_model.dart';
import 'package:pokemon_project/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class PokemonFavorite extends StatefulWidget {
  const PokemonFavorite({super.key});

  @override
  State<PokemonFavorite> createState() => _PokemonFavoriteState();
}

class _PokemonFavoriteState extends State<PokemonFavorite> {
  @override
  void initState() {
    super.initState();
  }

  FavoriteProvider name(BuildContext context) {
    return Provider.of<FavoriteProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    var pokemonFvaorites = name(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Card(
                elevation: 4,
                child: ListTile(
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      return pokemonFvaorites.deleteFavItem(PokemonListModel(
                          name: pokemonFvaorites.getFavItem()[index].name.toString(),
                          url: pokemonFvaorites.getFavItem()[index].url.toString()));
                    },
                  ),
                  title: Text(pokemonFvaorites.getFavItem()[index].name.toString()),
                  subtitle: Text(pokemonFvaorites.getFavItem()[index].url.toString()),
                ),
              );
            }),
            itemCount: pokemonFvaorites.count,
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
