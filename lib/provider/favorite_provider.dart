import 'package:flutter/material.dart';
import 'package:pokemon_project/pokemon_list/model/pokemon_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  int count = 0;

  List<PokemonListModel> pokemonList = [];
  Future<void> addCount() async {
    count = await getCount();
    count++;
    setCount();
    notifyListeners();
  }

  Future<SharedPreferences> prefInstance() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<void> setCount() async {
    final prefs = await prefInstance();
    prefs.setInt('count', count);
  }

  Future<int> getCount() async {
    final prefs = await prefInstance();
    return prefs.getInt('count') ?? 0;
  }

  Future<void> removeCount() async {
    count--;
    await setCount();
    notifyListeners();
  }

  Future<void> addFavItem(PokemonListModel model) async {
    if (!isInFavorite(model)) {
      pokemonList.add(model);
      addCount();
      notifyListeners();
    }
  }

  List<PokemonListModel> getFavItem() {
    return pokemonList;
  }

  void deleteFavItem(PokemonListModel model) {
    pokemonList.remove(model);
    removeCount();
    notifyListeners();
  }

  bool isInFavorite(PokemonListModel model) {
    if (pokemonList.contains(model)) {
      return true;
    } else {
      return false;
    }
  }
}
