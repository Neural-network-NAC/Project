// ignore_for_file: unnecessary_this

class Light {
  String location = "";
  String name = "";
  bool status = false;
  List<double> position = [];
  int tile = 0;

  Light.fromMap(Map data) {
    this.location = data['location'] ?? 'No location.';
    this.name = data['name'] ?? 'No name.';
    this.status = data['status'] ?? false;
    this.position = data['position'] ?? [0.0];
    this.tile = data['tile'] ?? 0;
  }
}
