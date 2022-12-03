// class PokemonListModel {
//   List<Results>? results;

//   PokemonListModel({this.results});

//   PokemonListModel.fromJson(Map<String, dynamic> json) {
//     if (json['results'] != null) {
//       results = <Results>[];
//       json['results'].forEach((v) {
//         results!.add(new Results.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.results != null) {
//       data['results'] = this.results!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Results {
//   String? name;
//   String? url;

//   Results({this.name, this.url});

//   Results.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     url = json['url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['url'] = this.url;
//     return data;
//   }
// }

import 'package:equatable/equatable.dart';

class PokemonListModel extends Equatable {
  String? name;
  String? url;

  PokemonListModel({this.name, this.url});

  PokemonListModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }

  @override
  List<Object?> get props => [name, url];
}
