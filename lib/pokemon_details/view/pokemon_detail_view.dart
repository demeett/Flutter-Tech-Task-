import 'package:flutter/material.dart';
import 'package:pokemon_project/pokemon_details/viewModel/pokemon_detail_view_model.dart';

class PokemonDetailView extends StatefulWidget {
  const PokemonDetailView({super.key, required this.path});
  final String path;

  @override
  State<PokemonDetailView> createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends PokemonDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            elevation: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    pokemonDetailModel?.image ?? "",
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Height: ${(pokemonDetailModel?.height.toString() ?? "0")}"),
                    Text("Weight: ${(pokemonDetailModel?.weight.toString() ?? "0")}"),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Name: ${(pokemonDetailModel?.name.toString() ?? "")}"),
                    Text("Order: ${(pokemonDetailModel?.order.toString() ?? "0")}"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
