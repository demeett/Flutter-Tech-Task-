class PokemonDetailModel {
  int? height;
  int? weight;
  String? name;
  int? order;
  String? image;


  PokemonDetailModel({this.height, this.weight, this.name, this.order, this.image});

  PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    weight = json['weight'];
    name=json['name'];
    order=json['order'];
    name=json['sprites']["bac_default"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['weight'] = weight;
    return data;
  }
}
