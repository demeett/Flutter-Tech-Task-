import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_project/pokemon_list/model/pokemon_list_model.dart';
import 'package:pokemon_project/pokemon_list/service/pokemon_list_service.dart';
import 'package:pokemon_project/pokemon_list/view/pokemon_list_view.dart';

abstract class PokemonListViewModel extends State<PokemonListView> {
  late final IPokemonService pokemonService;
  List<PokemonListModel> pokemons = [];
  @override
  void initState() {
    super.initState();
    pokemonService = PokemonService(Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/")));
    fetch();
  }

  Future<void> fetch() async {
    pokemons = await pokemonService.fecthPokemonItem() ?? [];
  }
}
