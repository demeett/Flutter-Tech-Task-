import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokemon_project/pokemon_list/model/pokemon_list_model.dart';

abstract class IPokemonService {
  IPokemonService(this.dio);

  final Dio dio;
  Future<List<PokemonListModel>?> fecthPokemonItem();
}

class PokemonService extends IPokemonService {
  PokemonService(super.dio);

  @override
  Future<List<PokemonListModel>?> fecthPokemonItem() async {
    final response = await dio.get("pokemon");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = await response.data["results"];
      if (jsonBody is List) {
        return jsonBody.map((json) => PokemonListModel.fromJson(json)).toList();
      }
    }
    return null;
  }
}
