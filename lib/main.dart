import 'package:flutter/material.dart';
import 'package:pokemon_project/pokemon_list/view/pokemon_list_view.dart';
import 'package:pokemon_project/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(create: (context) => FavoriteProvider(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
   

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: PokemonListView(
       
      ),
    );
  }
}
