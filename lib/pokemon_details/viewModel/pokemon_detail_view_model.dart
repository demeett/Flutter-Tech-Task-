import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_project/pokemon_details/model/pokemon_detail_model.dart';
import 'package:pokemon_project/pokemon_details/service/pokemon_detail_service.dart';
import 'package:pokemon_project/pokemon_details/view/pokemon_detail_view.dart';

abstract class PokemonDetailViewModel extends State<PokemonDetailView> {
  late final PokemonDetailService detailservice;
  PokemonDetailModel? pokemonDetailModel;
  @override
  void initState() {
    super.initState();
    detailservice = PokemonDetailService(Dio(BaseOptions(baseUrl: widget.path)));
    getDetails();
  }

  Future<void> getDetails() async {
    pokemonDetailModel = (await detailservice.getPokemonDetails());
  }
}
