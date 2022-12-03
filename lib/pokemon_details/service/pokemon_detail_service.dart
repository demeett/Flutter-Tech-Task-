import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokemon_project/pokemon_details/model/pokemon_detail_model.dart';

abstract class IPokemonDetailService {
  IPokemonDetailService(this.dio);
  final Dio dio;
  Future<void> getPokemonDetails();
}

class PokemonDetailService extends IPokemonDetailService {
  PokemonDetailService(super.dio);

  @override
  Future<PokemonDetailModel?> getPokemonDetails() async {
    final response = await dio.get("");
    if (response.statusCode == HttpStatus.ok) {
      final result = response.data["height"];
      PokemonDetailModel model = PokemonDetailModel(
          height: response.data["height"],
          weight: response.data["weight"],
          name: response.data["name"],
          image: response.data["sprites"]["back_default"],
          order: response.data["order"]);
      return model;
    }
    return null;
  }
}
