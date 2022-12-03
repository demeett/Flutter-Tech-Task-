import 'package:flutter/material.dart';
import 'package:pokemon_project/nav_bar/custom_nav_bar.dart';
import 'package:pokemon_project/pokemon_details/view/pokemon_detail_view.dart';
import 'package:pokemon_project/pokemon_favorite/view/pokemon_favorite_view.dart';
import 'package:pokemon_project/pokemon_list/model/pokemon_list_model.dart';
import 'package:pokemon_project/pokemon_list/viewModel/pokemon_list_view_model.dart';
import 'package:provider/provider.dart';

import '../../provider/favorite_provider.dart';

class PokemonListView extends StatefulWidget {
  PokemonListView({super.key, required this.provider});
  FavoriteProvider provider;
  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends PokemonListViewModel {
  Color favoriteColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    var pokemonFvaorites = Provider.of<FavoriteProvider>(context);
    final String countValue = pokemonFvaorites.count.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon List"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Text(countValue),
                IconButton(
                  icon: const Icon(Icons.favorite_outline),
                  onPressed: () {
                    navToWidget(context, const PokemonFavorite());
                  },
                )
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                  onTap: () {
                    final path = pokemons[index].url;
                    navToWidget(context, PokemonDetailView(path: path.toString()));
                  },
                  child: ListTileWidget(index: index, pokemonFav: pokemonFvaorites, pokemons: pokemons)),
            );
          },
          itemCount: pokemons.length),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  void navToWidget(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}

class ListTileWidget extends StatelessWidget {
  final int index;
  final FavoriteProvider pokemonFav;
  final List<PokemonListModel> pokemons;
  const ListTileWidget({super.key, required this.index, required this.pokemonFav, required this.pokemons});
  @override
  Widget build(BuildContext context) {
    Color favoriteColor = Colors.grey;

    return ListTile(
      title: Text(pokemons[index].name.toString()),
      trailing: IconButton(
        icon: pokemonFav.isInFavorite(
                    PokemonListModel(name: pokemons[index].name.toString(), url: pokemons[index].url.toString())) ==
                false
            ? Icon(
                Icons.favorite_border_outlined,
                color: favoriteColor,
              )
            : const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
        onPressed: () {
          pokemonFav.isInFavorite(
                      PokemonListModel(name: pokemons[index].name.toString(), url: pokemons[index].url.toString())) ==
                  false
              ? pokemonFav.addFavItem(
                  PokemonListModel(name: pokemons[index].name.toString(), url: pokemons[index].url.toString()))
              : pokemonFav.deleteFavItem(
                  PokemonListModel(name: pokemons[index].name.toString(), url: pokemons[index].url.toString()));
        },
      ),
    );
  }
}
