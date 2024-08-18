class Hospital {
  final int id;
  final String name;
  final String password;

  Hospital({required this.id, required this.name, required this.password});
  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
        id: json['id'], name: json['name'], password: json['password']);
  }
}
