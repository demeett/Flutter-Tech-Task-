class Constants {
  Constants._();
  static final Constants _instance = Constants._();
  factory Constants() => _instance;

  final baseUrl = "https://pokeapi.co/api/v2/";
}
