class Position{
  late double x;
  late double y;
  String urlMaps = '';

  Position(this.x, this.y) {
    urlMaps = "https://www.google.com.br/maps/place/$x%C2%B000'00.0%22N+$y%C2%B000'00.0%22W/@$x,$y,11.85z";
  }
}